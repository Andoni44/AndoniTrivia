//
//  GameViewModelProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

protocol GameViewModelProtocol: ViewModelProtocol {
    
    var gameOutPutView: GameViewOutPutProtocol? { get set }
    func setPlayers()
    func loadNewGame()
}
