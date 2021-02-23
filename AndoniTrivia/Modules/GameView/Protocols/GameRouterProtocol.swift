//
//  GameRouterProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

protocol GameRouterProtocol: RouterProtocol {
    
    func presentAuxView(fromView: GameViewProtocol, playerName: String)
    func presentFinalView(fromView: GameViewProtocol)
}
