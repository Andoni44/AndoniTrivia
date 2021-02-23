//
//  ResultsRouterProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

protocol ResultsRouterProtocol: RouterProtocol {
    
    func presentGameView(fromView: ResultsViewProtocol)
}
