//
//  GameViewModel.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

final class GameViewModel {
    
    let defaults = UserDefaults.standard
    weak var gameOutPutView: GameViewOutPutProtocol?
}

//MARK: - ViewModel
extension GameViewModel: GameViewModelProtocol {
    
    func loadNewGame() {
        ApiFactory().loadNewGame {[unowned self] game in
            self.gameOutPutView?.setGame(game)
        } onFailure: {[unowned self] errorMessage in
            self.gameOutPutView?.setGame(onError: errorMessage ?? "Unknown error")
        }

    }
    
    func setPlayers() {
        if let playerOne = loadPlayer(1), let playerTwo = loadPlayer(2) {
            gameOutPutView?.setPlayers(players: [playerOne, playerTwo])
        }
    }
    
}
