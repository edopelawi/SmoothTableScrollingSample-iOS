//
//  MenuViewController.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/16/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Menu"
		
		configureNavigationBar()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = true
	}
	
	fileprivate func configureNavigationBar() {
		guard let navigationBar = self.navigationController?.navigationBar else {
			return
		}
		
		navigationBar.barTintColor = self.view.backgroundColor
		navigationBar.tintColor = UIColor.white
		
		navigationBar.titleTextAttributes = [
			NSForegroundColorAttributeName: UIColor.white
		]
	}
	
	@IBAction fileprivate func navigateToSimpleTableSample(_ sender: Any) {
		
		let viewController = SimpleTableViewController()
		
		self.navigationController?.pushViewController(viewController, animated: true)
	}

	@IBAction fileprivate func navigateToSocialMediaTimeline(_ sender: Any) {
		// TODO: Implement the navigation later.
	}
}
