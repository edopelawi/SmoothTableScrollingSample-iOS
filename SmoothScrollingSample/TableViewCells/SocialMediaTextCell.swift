//
//  SocialMediaTextCell.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/17/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SocialMediaTextCell: UITableViewCell {

	static let identifier = "SocialMediaTextCell"
	
	@IBOutlet fileprivate weak var avatarImageView: UIImageView!
	@IBOutlet fileprivate weak var nameLabel: UILabel!
	@IBOutlet fileprivate weak var contentLabel: UILabel!
	
	fileprivate var viewModel: SocialMediaCellViewModel?
	
	func configure(viewModel: SocialMediaCellViewModel) {
		
		self.viewModel = viewModel
		
		nameLabel.text = viewModel.userName
		contentLabel.text = viewModel.contentText
		
		fetchUserAvatar()
	}
	
	func fetchUserAvatar() {
		
		if let validAvatar = viewModel?.userAvatar {
			avatarImageView.image = validAvatar
			return
		}
		
		viewModel?.fetchUserAvatar { [weak self] (userAvatar: UIImage?) in
			self?.avatarImageView.image = userAvatar
		}
	}
    
}
