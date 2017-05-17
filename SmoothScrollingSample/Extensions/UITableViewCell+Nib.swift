//
//  UITableViewCell+Nib.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/16/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

extension UITableViewCell {
	
	static func nib() -> UINib? {
		
		let className = self.classForCoder().description()
		guard let nibName = className.components(separatedBy: ".").last else {
			return nil
		}
		
		return UINib(nibName: nibName, bundle: nil)
	}
	
}
