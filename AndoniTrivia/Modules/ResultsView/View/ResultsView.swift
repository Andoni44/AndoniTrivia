//
//  ResultsView.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import UIKit

final class ResultsView: UIViewController {

    @IBOutlet weak var triviaResultsHeader: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var winnerScoreLabel: UILabel!
    @IBOutlet weak var looserLabel: UILabel!
    @IBOutlet weak var looserScoreLabel: UILabel!
    @IBOutlet weak var button: TriviaButton!
    
    var router: ResultsRouterProtocol?
    var viewModel: ResultsViewModelProtocol? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLang()
        setResults()
    }
}

// MARK: - View
extension ResultsView: ResultsViewProtocol {
    
}

// MARK: - Front
extension ResultsView {
    
    func setupLang() {
        triviaResultsHeader.text =  NSLocalizedString("results", comment: "")
        button.setTitle(NSLocalizedString("again", comment: ""), for: .normal)
    }
}

// MARK: - Private
extension ResultsView {
    
    func setResults() {
        //TODO: tie
        if let player1 = viewModel?.loadPlayer(1), let player2 = viewModel?.loadPlayer(2) {
            var winner: Player!
            var looser: Player!
            if player1.score > player2.score {
                winner = player1
                looser = player2
            } else {
                winner = player2
                looser = player1
            }
            winnerLabel.text = winnerLabel.text?.replacingOccurrences(of: "{$0}", with: winner.nick)
            winnerScoreLabel.text = String(winner.score)
            looserLabel.text = looserLabel.text?.replacingOccurrences(of: "{$0}", with: looser.nick)
            looserScoreLabel.text = String(looser.score)
        }
    }
}

// MARK: - Actions
private extension ResultsView {
    
    @IBAction func playAgainAction(_ sender: TriviaButton) {
        router?.presentGameView(fromView: self)
    }
}
