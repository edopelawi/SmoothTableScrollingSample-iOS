//
//  SimpleTableViewCell.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/16/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SimpleTableViewCell: UITableViewCell {

	static let identifier = "SimpleTableViewCell"
	
	@IBOutlet private weak var label: UILabel?
	
	func configure(text: String) {
		self.label?.text = text
	}
	
}
