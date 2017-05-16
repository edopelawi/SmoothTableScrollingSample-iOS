//
//  SimpleTableViewController.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/16/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SimpleTableViewController: UIViewController {

	@IBOutlet fileprivate weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Register cells later.
    }
	
}

extension SimpleTableViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {

		self.log(function: #function)
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		self.log(function: #function)
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		self.log(function: #function)
		
		// TODO: Add proper dequeing code later.
		return UITableViewCell()
	}
	
}
