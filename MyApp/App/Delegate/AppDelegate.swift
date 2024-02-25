//
//  AppDelegate.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	var services: AppServices!

	func application(
		_ application: UIApplication,
		willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
	) -> Bool {
		return true
	}
	
	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {
		services = AppServices()

		return true
	}
	
	func applicationDidBecomeActive(_ application: UIApplication) {}
	func applicationWillResignActive(_ application: UIApplication) {}
	func applicationDidEnterBackground(_ application: UIApplication) {}
	func applicationWillEnterForeground(_ application: UIApplication) {}
	func applicationWillTerminate(_ application: UIApplication) {}
}

// MARK: UISceneSession Lifecycle
extension AppDelegate {
	
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

extension UIApplication {
	
	static var myApp: AppDelegate {
		return UIApplication.shared.delegate as! AppDelegate
	}
}
