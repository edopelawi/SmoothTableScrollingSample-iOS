//
//  UIViewController+Logger.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/16/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

final class Logger {
	
	static let shared = Logger()
	
	private let dateFormatter: DateFormatter
	private init() {
		dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
	}
	
	func log(_ string: String) {
		let currentTime = Date()
		let logTime = dateFormatter.string(from: currentTime)
		
		print("[\(logTime)] \(string)")
	}
}

extension UIViewController {
	
	func log(function: Selector, additionalInfo: String = "") {
		Logger.shared.log("\(function) \(additionalInfo)")
	}
}
