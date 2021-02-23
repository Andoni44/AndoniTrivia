//
//  RouterProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 8/1/21.
//

import UIKit

protocol RouterProtocol {
    
    func presentAlert(onView view: UIViewController, withTitle title: String, andMessage message: String, style: UIAlertAction.Style)
    func createViewController() -> UIViewController
}

extension RouterProtocol {
    
    func presentAlert(onView view: UIViewController, withTitle title: String, andMessage message: String, style: UIAlertAction.Style = .default) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
            view.present(alert, animated: true)
        }
    }
    
    var viewController: UIViewController{
        return createViewController()
    }
    
}
