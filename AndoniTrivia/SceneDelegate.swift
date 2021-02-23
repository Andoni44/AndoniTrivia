//
//  SceneDelegate.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 8/1/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let initialViewController = WelcomeRouter().viewController
        self.window = UIWindow(windowScene: windowScene)
        self.window!.rootViewController = initialViewController
        self.window!.makeKeyAndVisible()
           
    }
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        let transition = CATransition()
        transition.startProgress = 0
        transition.endProgress = 1.0
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        transition.duration = 0.15
        window.rootViewController?.view.layer.add(transition, forKey: "transition")
        vc.view.layer.add(transition, forKey: "transition")
        window.rootViewController?.view.isHidden = false
        vc.view.isHidden = false
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }

}

