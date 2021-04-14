//
//  SceneDelegate.swift
//  SmpCard
//
//  Created by Максим Жуков on 04.12.2020.
//  Copyright © 2020 SMP. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
   
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Verdana", size: 18)!, .foregroundColor: UIColor.white]
            UINavigationBar.appearance().backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            switch AuthService.shared.checkAuthentication() {
            case .signed:
                let mainController = MainTableViewContoller()
                mainController.viewModel = MainViewModel()
                let navController = CustomNavigationController(rootViewController: mainController)
                window.rootViewController = navController
            case .signedOut:
                let authController = AuthViewController()
                authController.viewModel = AuthViewModel()
                window.rootViewController = authController
            }
         
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
