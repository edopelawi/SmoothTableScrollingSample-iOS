//
//  SocialMediaImageCell.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/18/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SocialMediaImageCell: UITableViewCell {

	static let identifier = "SocialMediaImageCell"
	
	@IBOutlet fileprivate weak var avatarImageView: UIImageView!
	@IBOutlet fileprivate weak var nameLabel: UILabel!
	
	@IBOutlet fileprivate weak var contentLabel: UILabel!
	@IBOutlet fileprivate weak var contentImageView: UIImageView!
	
	fileprivate var viewModel: SocialMediaCellViewModel?
	
	func configure(viewModel: SocialMediaCellViewModel) {
		
		self.viewModel = viewModel
		
		nameLabel.text = viewModel.userName
		contentLabel.text = viewModel.contentText
		
		fetchUserAvatar()
		fetchContentImage()
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
	
	func fetchContentImage() {
		
		if let validImage = viewModel?.contentImage {
			contentImageView.image = validImage
			return
		}
		
		viewModel?.fetchContentImage() { [weak self] (contentImage: UIImage?) in
			self?.contentImageView.image = contentImage
		}
	}
	
}
