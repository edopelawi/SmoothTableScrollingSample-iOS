//
//  SimpleTableViewController.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/16/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class SimpleTableViewController: UIViewController {

	@IBOutlet fileprivate weak var tableView: UITableView?
	
	var tableData = [String]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		registerTableCells()
		populateTableData()
		
		tableView?.reloadData()
    }
	
	private func registerTableCells() {
		tableView?.register(SimpleTableViewCell.nib(), forCellReuseIdentifier: SimpleTableViewCell.identifier)
	}
	
	private func populateTableData() {
		
		let rawData: [Int] = Array(1...20)
		tableData = rawData.map { "\($0)" }
	}
	
}

extension SimpleTableViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
	
		self.log(function: #function)
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		self.log(function: #function)
		return tableData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		self.log(function: #function)
		
		let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier, for: indexPath)
		
		guard let simpleCell = cell as? SimpleTableViewCell else {
			return cell
		}
		
		let text = tableData[indexPath.row]
		simpleCell.configure(text: text)
		
		return simpleCell
	}
	
}
