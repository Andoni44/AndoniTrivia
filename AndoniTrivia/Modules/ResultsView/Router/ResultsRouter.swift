//
//  ResultsRouter.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import UIKit

final class ResultsRouter {
    
    func createViewController() -> UIViewController {
        let view: ResultsViewProtocol = ResultsView(nibName: "ResultsView", bundle: Bundle.main)
        let viewModel: ResultsViewModelProtocol = ResultsViewModel()
        view.viewModel = viewModel
        view.router = self
        if let view = view as? UIViewController {
            return view
        } else {
            return UIViewController()
        }
    }
}

//MARK: - Router
extension ResultsRouter: ResultsRouterProtocol {
    
    func presentGameView(fromView: ResultsViewProtocol) {
        guard let view = fromView as? UIViewController else { return }
            let mySceneDelegate = view.view.window?.windowScene?.delegate
            if let sceneDelegate = mySceneDelegate as? SceneDelegate {
                let gv = GameRouter().viewController
                sceneDelegate.changeRootViewController(gv)
            }
        
    }
}
