//
//  WelcomeRouter.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 8/1/21.
//

import UIKit

final class WelcomeRouter {
    
    
}

//MARK: - Router
extension WelcomeRouter: WelcomeRouterProtocol {
    
    func createViewController() -> UIViewController {
        let view: WelcomeViewProtocol = WelcomeView(nibName: "WelcomeView", bundle: Bundle.main)
        let viewModel: WelcomeViewModel = WelcomeViewModel()
        view.viewModel = viewModel
        view.router = self
        if let view = view as? UIViewController {
            return view
        } else {
            return UIViewController()
        }
    }
    
    func presentGameView(fromView view: WelcomeViewProtocol) {
        guard let view = view as? UIViewController else { return }
            let mySceneDelegate = view.view.window?.windowScene?.delegate
            if let sceneDelegate = mySceneDelegate as? SceneDelegate {
                let gameView = GameRouter().viewController
                sceneDelegate.changeRootViewController(gameView)
            }
    }
}
