//
//  SocialMediaCellViewModel.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/18/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SocialMediaCellViewModel {		
	
	var userName: String {
		return item.user.name
	}
	
	var contentText: String? {
		return item.text
	}
	
	var contentImage: UIImage?
	
	fileprivate let item: SocialMediaTimelineItem
	
	init(item: SocialMediaTimelineItem) {
		self.item = item
	}
	
	func getUserAvatar() -> UIImage? {
		return getImage(for: item.user.avatarURL)
	}
	
	private func getImage(for url: URL?) -> UIImage? {
		
		guard let validURL = url,
			let data = try? Data(contentsOf: validURL) else {
				return nil
		}
		
		return UIImage(data: data)
	}
}
