//
//  WelcomeView.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 8/1/21.
//

import UIKit

final class WelcomeView: UIViewController {
    
    @IBOutlet weak var welcomeStackView: UIStackView!
    @IBOutlet weak var nickTextField: TriviaTF!
    @IBOutlet weak var continueButton: TriviaButton!
    @IBOutlet weak var playerStack: UIStackView!
    @IBOutlet weak var welcomeTitle: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var playerHeaderLabel: UILabel!
    
    var viewModel: WelcomeViewModelProtocol?
    var router: WelcomeRouterProtocol?
    
    var isPlayerOneSaved = false
    var isTFPresented = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFront()
    }
}

// MARK: - Actions
private extension WelcomeView {
    
    @IBAction func continueAction(_ sender: TriviaButton) {
        if !isTFPresented {
            isTFPresented = true
            removeTextFieldWithTransition()
            continueButton.setTitle(NSLocalizedString("continue", comment: ""), for: .normal)
            self.continueButton.isEnabled = false
            self.continueButton.alpha = 0.5
        } else if !isPlayerOneSaved {
            isPlayerOneSaved = true
            let playerOne = Player(nick: nickTextField.text ?? "", score: 0, number: 1)
            viewModel?.savePlayer(playerOne, completion: {
                self.nickTextField.text = ""
                self.playerHeaderLabel.text = NSLocalizedString("player_two", comment: "")
                self.continueButton.setTitle(NSLocalizedString("go", comment: ""), for: .normal)
                self.continueButton.isEnabled = false
                self.continueButton.alpha = 0.5
            })
        } else {
            let playerTwo = Player(nick: nickTextField.text ?? "", score: 0, number: 2)
            viewModel?.savePlayer(playerTwo, completion: {
                self.router?.presentGameView(fromView: self)
            })
        }
    }
}

// MARK: - Front
private extension WelcomeView {
    
    func setupLang() {
        continueButton.setTitle(NSLocalizedString("continue", comment: ""), for: .normal)
        welcomeTitle.text = NSLocalizedString("welcome", comment: "")
        subTitleLabel.text = NSLocalizedString("enter_nicks", comment: "")
        self.playerHeaderLabel.text = NSLocalizedString("player_one", comment: "")
    }
    
    func setupFront() {
        setupLang()
        nickTextField.delegate = self
        nickTextField.attributedPlaceholder =  NSAttributedString(string: NSLocalizedString("tf_placeholder", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        animateTitleWithSpring()
    }
    
    
}

// MARK: - Private
private extension WelcomeView {
    
    func animateTitleWithSpring() {
        UIView.animate(withDuration: 1.4, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            
            self.welcomeTitle.alpha = 1
            self.welcomeTitle.frame.origin.y += 300
            
        }){ _ in
            self.animateSubtitleWithSpring()
        }
    }
    
    func animateSubtitleWithSpring() {
        UIView.animate(withDuration: 1.0, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            
            self.subTitleLabel.alpha = 1
            
        }){ _ in
            self.showContinueButton()
        }
    }
    
    func showContinueButton() {
        UIView.transition(with: self.continueButton, duration: 0.4, options: [.transitionFlipFromTop], animations: {
            self.continueButton.isHidden = false
        }, completion: nil)
    }
    
    func removeTextFieldWithTransition() {
        UIView.transition(with: self.playerStack, duration: 0.4, options: [.transitionFlipFromLeft], animations: {
            self.welcomeStackView.removeFromSuperview()
            self.playerStack.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
            
            self.continueButton.center.y -= 50
            
        }){ _ in
            
        }
    }
}

// MARK: - View
extension WelcomeView: WelcomeViewProtocol {
    
}

// MARK: - TextField
extension WelcomeView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if text.isEmpty {
            continueButton.isEnabled = false
            continueButton.alpha = 0.5
        } else {
            continueButton.isEnabled = true
            continueButton.alpha = 1.0
        }
        return true
    }
    
}

