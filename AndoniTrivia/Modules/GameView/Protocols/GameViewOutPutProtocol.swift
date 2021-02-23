//
//  GameViewOutPutProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

protocol GameViewOutPutProtocol: class {
    
    func setGame(_ game: [Game])
    func setGame(onError error: String)
    func setPlayers(players: [Player])
}
