//
//  SocialMediaCellViewModel.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/18/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SocialMediaCellViewModel {		
	
	var userAvatar: UIImage?
	
	var userName: String {
		return item.user.name
	}
	
	var contentText: String? {
		return item.text
	}
	
	var contentImage: UIImage?
	
	fileprivate let item: SocialMediaTimelineItem
	fileprivate var ongoingDataTasks = [String: URLSessionDataTask]()
	
	// MARK: - Public methods
	
	init(item: SocialMediaTimelineItem) {
		self.item = item
	}
	
	/// Fetchs user avatar from server. Will update this instance's `userAvatar` and execute `completion` with retrieved `UIImage?`.
	func fetchUserAvatar(completion: @escaping (UIImage?) -> Void) {
		
		if let validImage = userAvatar {
			completion(validImage)
			return
		}
		
		// TODO: Replace this with asynchronous method for better performance later.
		userAvatar = getImage(for: item.user.avatarURL)
		completion(userAvatar)
	}
	
	/// Fetchs content image from server. Will update this instance's `contentImage` and execute `completion` with retrieved `UIImage?`.
	func fetchContentImage(completion: @escaping (UIImage?) -> Void) {
	
		if let validImage = contentImage {
			completion(validImage)
			return
		}
		
		userAvatar = getImage(for: item.imageURL)
		completion(userAvatar)
	}
	
	func stopAllFetchTasks() {
		
		DispatchQueue.main.async { [weak self] in
			
			self?.ongoingDataTasks.forEach { (_, task: URLSessionDataTask) in
				task.cancel()
			}
			
			self?.ongoingDataTasks = [:]
		}
	}
	
	// MARK: - Private methods
	
	/// Synchronous method to retrieve image from URL.
	private func getImage(for url: URL?) -> UIImage? {
		
		guard let validURL = url,
			let data = try? Data(contentsOf: validURL) else {
				return nil
		}
		
		return UIImage(data: data)
	}
	
	private func fetchImage(for url: URL?, completion: @escaping (UIImage?) -> Void) {
		
		guard let validURL = url else {
			completion(nil)
			return
		}
		
		let dataTaskID = "\(Date())"
		
		let dataTask = URLSession.shared.dataTask(with: validURL) { [weak self] (data: Data?, _, _) in
			
			self?.removeDataTask(withID: dataTaskID)
			
			guard let validData = data else {
				completion(nil)
				return
			}
			
			let image = UIImage(data: validData)
			completion(image)
		}
		
		
		self.add(dataTask: dataTask, withID: dataTaskID)
		dataTask.resume()
	}
	
	private func add(dataTask: URLSessionDataTask, withID id: String) {
		
		DispatchQueue.main.async { [weak self] in
			self?.ongoingDataTasks[id] = dataTask
		}
	}
	
	private func removeDataTask(withID id: String) {
		
		DispatchQueue.main.async { [weak self] in
			let _ = self?.ongoingDataTasks.removeValue(forKey: id)
		}
	}
}
