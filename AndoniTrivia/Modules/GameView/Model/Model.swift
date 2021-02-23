//
//  Model.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

struct Player: Codable {
    let nick: String
    var score: Int
    let number: Int
    
    mutating func setPlayerScore(_ score: Int) {
        self.score = score
    }
}

