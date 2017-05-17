//
//  SocialMediaTimelineViewController.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/17/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SocialMediaTimelineViewController: UIViewController {

	@IBOutlet fileprivate weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Social Media"
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.isNavigationBarHidden = false
	}
}
