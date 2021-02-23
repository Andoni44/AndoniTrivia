//
//  WelcomeRouterProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 8/1/21.
//

import Foundation

protocol WelcomeRouterProtocol: RouterProtocol {
 
    func presentGameView(fromView view: WelcomeViewProtocol)
}
