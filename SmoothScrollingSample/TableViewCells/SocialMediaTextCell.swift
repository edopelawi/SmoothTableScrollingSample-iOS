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
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }
	
	func configure(viewModel: SocialMediaCellViewModel) {
		
		// TODO: Add code for loading avatar later.
		
		avatarImageView.image = viewModel.userAvatar
		nameLabel.text = viewModel.userName
		contentLabel.text = viewModel.contentText		
	}
    
}
