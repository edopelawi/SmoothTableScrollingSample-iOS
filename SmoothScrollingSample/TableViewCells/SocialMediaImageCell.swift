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
	
	fileprivate func fetchUserAvatar() {
		
		let backgroundColor = self.contentView.backgroundColor
		
		if let validAvatar = viewModel?.userAvatar {
			avatarImageView.backgroundColor = backgroundColor
			avatarImageView.image = validAvatar
			return
		}
		
		viewModel?.fetchUserAvatar { [weak self] (userAvatar: UIImage?) in
			DispatchQueue.main.async {
				
				self?.avatarImageView.backgroundColor = backgroundColor
				self?.avatarImageView.image = userAvatar
			}
		}
	}
	
	fileprivate func fetchContentImage() {
		
		let backgroundColor = self.contentView.backgroundColor
		
		if let validImage = viewModel?.contentImage {
			contentImageView.image = validImage
			contentImageView.backgroundColor = backgroundColor
			return
		}
		
		viewModel?.fetchContentImage() { [weak self] (contentImage: UIImage?) in
			DispatchQueue.main.async {
				
				self?.contentImageView.backgroundColor = backgroundColor
				self?.contentImageView.image = contentImage
			}
		}
	}
	
	fileprivate func configureForCurrentViewModel() {
		
		let className = String(describing: type(of: self))
		Logger.shared.log("\(className): \(#function)")
		
		guard let viewModel = viewModel else {
			return
		}
		
		nameLabel.text = viewModel.userName
		nameLabel.backgroundColor = self.contentView.backgroundColor
		
		contentLabel.text = viewModel.contentText
		contentLabel.backgroundColor = self.contentView.backgroundColor
		
		fetchUserAvatar()
		fetchContentImage()
	}
	
	private func resetState() {

		viewModel = nil
		
		let emptyStateBackgroundColor = UIColor(
			red: 0,
			green: 128.0 / 255.0,
			blue: 1,
			alpha: 1
		)
		
		let imageViews: [UIImageView] = [
			avatarImageView, contentImageView
		]
		
		let labels: [UILabel] = [
			nameLabel, contentLabel
		]
		
		imageViews.forEach { imageView in
			imageView.image = nil
			imageView.backgroundColor = emptyStateBackgroundColor
		}
		
		labels.forEach { label in
			label.text = ""
			label.backgroundColor = emptyStateBackgroundColor
		}
	}
}

extension SocialMediaImageCell: SocialMediaCell {

	
	static func height(for viewModel: SocialMediaCellViewModel) -> CGFloat {
		
		let topPadding = CGFloat(16)
		let bottomPadding = CGFloat(8)
		
		let nameLabelHeight = CGFloat(22)
		let nameLabelBottomPadding = CGFloat(8)
		
		let contentLabelHeight = SocialMediaImageCell.contentLabelHeight(for: viewModel.contentText)
		let contentLabelBottomPadding = CGFloat(8)
		
		let imageViewHeight = CGFloat(140)
		
		return topPadding + bottomPadding +
			nameLabelHeight + nameLabelBottomPadding +
			contentLabelHeight + contentLabelBottomPadding +
			imageViewHeight
		
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
