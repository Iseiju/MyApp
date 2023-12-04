//
//  AppDelegate.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var services: AppServices!

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {
		services = AppServices()

		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(
		_ application: UIApplication,
		configurationForConnecting connectingSceneSession: UISceneSession,
		options: UIScene.ConnectionOptions
	) -> UISceneConfiguration {

		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(
		_ application: UIApplication,
		didDiscardSceneSessions sceneSessions: Set<UISceneSession>
	) {}
}
