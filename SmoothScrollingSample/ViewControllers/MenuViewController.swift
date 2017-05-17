//
//  MenuViewController.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/16/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = true
	}
	
	@IBAction fileprivate func navigateToSimpleTableSample(_ sender: Any) {
		
		let viewController = SimpleTableViewController()
		
		self.navigationController?.pushViewController(viewController, animated: true)
	}

}
