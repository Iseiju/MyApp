//
//  SceneDelegate.swift
//  MyApp
//
//  Created by Kenneth James Uy on 12/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	private var rootCoordinator: RootCoordinator?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let window = UIWindow(windowScene: windowScene)
		let myAppDelegate = UIApplication.myApp
		myAppDelegate.window = window
		self.window = window
		
		rootCoordinator = RootCoordinator(window, services: myAppDelegate.services)
		rootCoordinator?.start()
	}

	func sceneDidDisconnect(_ scene: UIScene) {}
	func sceneDidBecomeActive(_ scene: UIScene) {}
	func sceneWillResignActive(_ scene: UIScene) {}
	func sceneWillEnterForeground(_ scene: UIScene) {}
	func sceneDidEnterBackground(_ scene: UIScene) {}
}
