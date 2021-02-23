//
//  GameAuxViewProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import UIKit

protocol GameAuxViewProtocol: class {
    
    var router: GameAuxRouterProtocol? { get set }
    var playerName: String? { get set }
}
