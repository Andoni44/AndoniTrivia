//
//  ViewModelProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

protocol ViewModelProtocol {
    
    var defaults: UserDefaults { get }
    
    func savePlayer(_ player: Player, completion: (()->()))
    func loadPlayer(_ number: Int) -> Player?
}

extension ViewModelProtocol {
     
    func savePlayer(_ player: Player, completion: (()->())) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(player) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: String(player.number))
            completion()
        }
    }
    
    func loadPlayer(_ number: Int) -> Player? {
        var playerToRet: Player?
        if let savedPerson = defaults.object(forKey: String(number)) as? Data {
            let decoder = JSONDecoder()
            if let player = try? decoder.decode(Player.self, from: savedPerson) {
                playerToRet = player
            }
        }
        return playerToRet
    }
}
