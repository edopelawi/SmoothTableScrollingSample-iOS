//
//  SocialMediaTimelineViewController.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/17/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SocialMediaTimelineViewController: BaseViewController {

	@IBOutlet fileprivate weak var tableView: UITableView!
	
	fileprivate var viewModels = [SocialMediaCellViewModel]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Social Media"
		
		configureTableView()
		loadViewModels()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.isNavigationBarHidden = false
	}
	
	// MARK: - Private methods
	
	private func configureTableView() {
		
		tableView.register(SocialMediaTextCell.nib(), forCellReuseIdentifier: SocialMediaTextCell.identifier)
	}
	
	private func loadViewModels() {
		
		let factory = SocialMediaTimelineItemFactory.shared
		
		viewModels = factory.getTimelineItems()
			.map { (item: SocialMediaTimelineItem) -> SocialMediaCellViewModel in
				return SocialMediaCellViewModel(item: item)
			}
		
		tableView.reloadData()
	}
}

extension SocialMediaTimelineViewController: UITableViewDataSource {
	
	
	func numberOfSections(in tableView: UITableView) -> Int {
		
		self.log(function: #function)
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	
		self.log(function: #function)
		return viewModels.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		self.log(function: #function, additionalInfo: "with indexPath: \(indexPath)")
		
		let cell = tableView.dequeueReusableCell(withIdentifier: SocialMediaTextCell.identifier, for: indexPath)
		
		guard let textCell = cell as? SocialMediaTextCell else {
			return cell
		}
		
		let viewModel = viewModels[indexPath.row]
		textCell.configure(viewModel: viewModel)
		
		return textCell
	}
			
}

extension SocialMediaTimelineViewController: UITableViewDelegate {

	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		
		self.log(function: #function, additionalInfo: "with indexPath: \(indexPath)")
		return 100
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		self.log(function: #function, additionalInfo: "with indexPath: \(indexPath)")
		
		return UITableViewAutomaticDimension
	}
}

