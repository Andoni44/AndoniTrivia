//
//  ResultsViewProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

protocol ResultsViewProtocol: class {
    
    var router: ResultsRouterProtocol? { get set }
    var viewModel: ResultsViewModelProtocol? { get set}
}
