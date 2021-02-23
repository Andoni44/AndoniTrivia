//
//  GameView.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import UIKit

final class GameView: UIViewController {
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var optionaButtonRow: UIStackView!
    @IBOutlet weak var constraint: NSLayoutConstraint!
    
    var isFirstPlayer = true
    
    var games: [Game]? {
        didSet {
            setupFront()
        }
    }
    var gameNumber = 0 {
        didSet {
            print("Game number: ", gameNumber)
        }
    }
    var score = 0
    
    var viewModel: GameViewModelProtocol?
    var router: GameRouterProtocol?
    
    var players: [Player]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNewGame()
    }
    
    @IBAction func answerAction(_ sender: UIButton) {
        [self.greenButton, self.orangeButton, self.redButton, self.purpleButton].forEach {
            $0?.isUserInteractionEnabled = false
        }
        guard let games = games else { return }
        if sender.title(for: .normal) == games[gameNumber].correctAnswer {
            score += 1
            playerScoreLabel.text = String(score)
            self.router?.presentAlert(onView: self, withTitle: NSLocalizedString("answer", comment: ""), andMessage: NSLocalizedString("right", comment: ""))
        } else {
            self.router?.presentAlert(onView: self, withTitle: NSLocalizedString("answer", comment: ""), andMessage: NSLocalizedString("wrong", comment: ""))
        }
        if gameNumber < 9 {
            setNewQuestion()
            gameNumber += 1
        } else {
            if var players = players {
                players[isFirstPlayer ? 0 : 1].setPlayerScore(score)
            if !self.isFirstPlayer {
                self.viewModel?.savePlayer(players[1], completion: {
                    self.router?.presentFinalView(fromView: self)
                })
            } else {
                self.viewModel?.savePlayer(players[0], completion: {
                        self.isFirstPlayer = false
                        self.viewModel?.loadNewGame()
                        self.router?.presentAuxView(fromView: self, playerName: players[1].nick)
                    })
                }
            }
        }
    }
}

// MARK: - Front
private extension GameView {
    
    func setupFront() {
        guard let players = players else { return }
        score = 0
        gameNumber = 0
        DispatchQueue.main.async {
            self.playerScoreLabel.text = "0"
            self.playerLabel.text = self.isFirstPlayer ? players[0].nick + NSLocalizedString("score", comment: "") : players[1].nick + NSLocalizedString("score", comment: "")
        }
        setNewQuestion()
    }
}

// MARK: - Private
private extension GameView {
    
    func setNewGame() {
        viewModel?.setPlayers()
        viewModel?.loadNewGame()
    }
    
    func setNewQuestion() {
        guard let games = games else { return }
        DispatchQueue.main.async {
            let game = games[self.gameNumber]
            self.questionLabel.text = String(htmlEncodedString: game.question)
            var answerCollection: [String] = []
            game.incorrectAnswers.forEach {
                answerCollection.append($0)
            }
            answerCollection.append(game.correctAnswer)
            answerCollection.shuffle()
            
            if answerCollection.count == 2 {
                [self.greenButton, self.redButton].forEach {
                    $0?.setTitle(answerCollection[$0?.tag ?? 0], for: .normal)
                }
                
                UIView.animate(withDuration: 0.2) {
                    self.optionaButtonRow.isHidden = true
                    self.constraint.constant = 150
                }
            } else {
                self.optionaButtonRow.isHidden = false
                self.constraint.constant = 300
                [self.greenButton, self.orangeButton, self.redButton, self.purpleButton].forEach {
                    $0?.setTitle(answerCollection[$0?.tag ?? 0], for: .normal)
                }
                UIView.animate(withDuration: 0.2) {
                    self.constraint.constant = 300
                    self.optionaButtonRow.isHidden = false
                }
            }
            [self.greenButton, self.orangeButton, self.redButton, self.purpleButton].forEach {
                $0?.isUserInteractionEnabled = true
            }
        }
    }
}

// MARK: - View
extension GameView: GameViewProtocol, GameViewOutPutProtocol {
    
    func setGame(_ game: [Game]) {
        self.games = game
    }
    
    func setGame(onError error: String) {
        self.router?.presentAlert(onView: self, withTitle: "Error", andMessage: error)
    }
    
    func setPlayers(players : [Player]) {
        self.players = players
    }
}
