//
//  SocialMediaCell.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/18/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

protocol SocialMediaCell {
	
	
	static func height(for viewModel: SocialMediaCellViewModel) -> CGFloat
	
	func configure(viewModel: SocialMediaCellViewModel)
}
