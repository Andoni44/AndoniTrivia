//
//  ApiFactoryProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

protocol ApiFactoryProtocol {
    func loadNewGame(onSuccess: @escaping ([Game]) -> Void, onFailure: @escaping (String?) -> Void)
}
