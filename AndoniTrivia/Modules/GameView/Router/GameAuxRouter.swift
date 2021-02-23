//
//  GameAuxRouter.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import UIKit

final class GameAuxRouter {
    
    func createViewController() -> UIViewController {
        let view: GameAuxViewProtocol = GameAuxView(nibName: "GameAuxView", bundle: Bundle.main)
        view.router = self
        if let view = view as? UIViewController {
            return view
        } else {
            return UIViewController()
        }
    }
}

//MARK: - Router
extension GameAuxRouter: GameAuxRouterProtocol {
    
    func dismiss(formView: GameAuxViewProtocol) {
        if let view = formView as? UIViewController {
            view.dismiss(animated: true, completion: nil)
        }
    }
}
