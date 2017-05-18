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
		
		createRightBarButton()
		configureTableView()
		loadViewModels()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.isNavigationBarHidden = false
	}
	
	// MARK: - Private methods
	
	private func createRightBarButton() {
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(
			title: "Top!",
			style: .plain,
			target: self,
			action: #selector(SocialMediaTimelineViewController.scrollToTop)
		)
	}
	
	@objc private func scrollToTop() {

		let topIndexPath = IndexPath(row: 0, section: 0)
		tableView.scrollToRow(at: topIndexPath, at: .top, animated: true)
	}
	
	private func configureTableView() {
		
		tableView.register(SocialMediaTextCell.nib(), forCellReuseIdentifier: SocialMediaTextCell.identifier)
		
		tableView.register(SocialMediaImageCell.nib(), forCellReuseIdentifier: SocialMediaImageCell.identifier)
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
		
		let viewModel = viewModels[indexPath.row]
		let cellIdentifier = viewModel.contentType == .textOnly ? SocialMediaTextCell.identifier : SocialMediaImageCell.identifier
		
		return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
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
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		
		self.log(function: #function, additionalInfo: "with indexPath: \(indexPath)")
		
		let viewModel = viewModels[indexPath.row]
		guard let socialMediaCell = cell as? SocialMediaCell else {
			return
		}
		
		socialMediaCell.configure(viewModel: viewModel)
	}
	
	func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		self.log(function: #function, additionalInfo: "with indexPath: \(indexPath)")	
	}
	
}
