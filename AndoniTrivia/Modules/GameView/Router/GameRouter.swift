//
//  GameRouter.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import UIKit

final class GameRouter {
    
    func createViewController() -> UIViewController {
        let view: GameViewProtocol & GameViewOutPutProtocol = GameView(nibName: "GameView", bundle: Bundle.main)
        var viewModel: GameViewModelProtocol = GameViewModel()
        viewModel.gameOutPutView = view
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
extension GameRouter: GameRouterProtocol {
    
    func presentFinalView(fromView: GameViewProtocol) {
        guard let view = fromView as? UIViewController else { return }
        let mySceneDelegate = view.view.window?.windowScene?.delegate
        if let sceneDelegate = mySceneDelegate as? SceneDelegate {
            let rv = ResultsRouter().viewController
            sceneDelegate.changeRootViewController(rv)
        }
    }
    
    func presentAuxView(fromView: GameViewProtocol, playerName: String) {
        let view = GameAuxRouter().viewController
        if let view = view as? GameAuxViewProtocol {
            view.playerName = playerName
        }
        if let vc = fromView as? UIViewController {
            vc.present(view, animated: true, completion: nil)
        }
    }
}
