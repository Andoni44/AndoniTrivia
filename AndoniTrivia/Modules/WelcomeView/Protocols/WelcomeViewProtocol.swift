//
//  WelcomeViewProtocol.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 8/1/21.
//

import Foundation

protocol WelcomeViewProtocol: class {
    
    var viewModel: WelcomeViewModelProtocol? { get set }
    var router: WelcomeRouterProtocol? { get set }
}
