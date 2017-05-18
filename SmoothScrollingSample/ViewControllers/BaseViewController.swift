//
//  BaseViewController.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/18/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

	init() {
		
		let bundle = Bundle(for: type(of: self))
		let nibName = String(describing: type(of: self))
		
		super.init(nibName: nibName, bundle: bundle)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
