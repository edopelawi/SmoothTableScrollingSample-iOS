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
	
	override func awakeFromNib() {
		super.awakeFromNib()
		resetState()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		let className = String(describing: type(of: self))
		Logger.shared.log("\(className): \(#function)")
		
		resetState()
	}
	
	fileprivate func configureForCurrentViewModel() {
		
		let className = String(describing: type(of: self))
		Logger.shared.log("\(className): \(#function)")
		
		guard let viewModel = viewModel else {
			return
		}
		
		let backgroundColor = self.contentView.backgroundColor
		
		nameLabel.text = viewModel.userName
		nameLabel.backgroundColor = backgroundColor
		
		contentLabel.text = viewModel.contentText
		contentLabel.backgroundColor = backgroundColor
		
		fetchUserAvatar()
	}
	
	fileprivate func fetchUserAvatar() {
		
		let backgroundColor = self.contentView.backgroundColor
		
		if let validAvatar = viewModel?.userAvatar {
			
			avatarImageView.image = validAvatar
			avatarImageView.backgroundColor = backgroundColor
			return
		}
		
		viewModel?.fetchUserAvatar { [weak self] (userAvatar: UIImage?) in
			DispatchQueue.main.async {
				
				self?.avatarImageView.backgroundColor = backgroundColor
				self?.avatarImageView.image = userAvatar
			}
		}
	}
	
	private func resetState() {
		
		viewModel = nil
		
		let emptyStateBackgroundColor = UIColor(
			red: 0,
			green: 128.0 / 255.0,
			blue: 1,
			alpha: 1
		)
		
		avatarImageView.image = nil
		avatarImageView.backgroundColor = emptyStateBackgroundColor
		
		let labels: [UILabel] = [
			nameLabel, contentLabel
		]
		
		labels.forEach { label in
			label.text = ""
			label.backgroundColor = emptyStateBackgroundColor
		}
	}
}

extension SocialMediaTextCell: SocialMediaCell {

	
	static func height(for viewModel: SocialMediaCellViewModel) -> CGFloat {
		
		let topPadding = CGFloat(16)
		let bottomPadding = CGFloat(8)
		
		let nameLabelHeight = CGFloat(22)
		let nameLabelBottomPadding = CGFloat(8)
		
		let contentLabelHeight = SocialMediaTextCell.contentLabelHeight(for: viewModel.contentText)
		
		return topPadding + bottomPadding +
			nameLabelHeight + nameLabelBottomPadding +
			contentLabelHeight
	}
	
	fileprivate static func contentLabelHeight(for text: String?) -> CGFloat {
		
		guard let validText = text else {
			return CGFloat(0)
		}
		
		let font = UIFont.preferredFont(forTextStyle: .body)
		let screenWidth = UIScreen.main.bounds.width
		let contentLabelHorizontalPadding = CGFloat(8 + 40 + 8 + 8)
		
		let contentLabelWidth = screenWidth - contentLabelHorizontalPadding
		
		return validText.displayHeight(
			width: contentLabelWidth,
			font: font
		)
	}
	
	func configure(viewModel: SocialMediaCellViewModel) {
		
		self.viewModel = viewModel
		
		let delayTime = DispatchTime.now() + 0.2
		
		DispatchQueue.main.asyncAfter(deadline: delayTime) { [weak self] in
			
			guard let currentViewModel = self?.viewModel,
				currentViewModel === viewModel else {
					return
			}
			
			self?.configureForCurrentViewModel()
		}
	}
}
