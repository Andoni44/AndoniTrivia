//
//  GameViewProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

protocol GameViewProtocol: class {
    
    var viewModel: GameViewModelProtocol? { get set }
    var router: GameRouterProtocol? { get set }
}
