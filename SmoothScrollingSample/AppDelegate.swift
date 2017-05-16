//
//  AppDelegate.swift
//  SmoothScrollingSample
//
//  Created by Ricardo Pramana Suranta on 5/16/17.
//  Copyright © 2017 Ricardo Pramana Suranta. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	
		let windowFrame = UIScreen.main.bounds
		let mainWindow = UIWindow(frame: windowFrame)
		
		let viewController = MenuViewController()
		let navigationController = UINavigationController(rootViewController: viewController)
		
		mainWindow.rootViewController = navigationController
		mainWindow.makeKeyAndVisible()
		
		self.window = mainWindow
		
		return true
	}
}

