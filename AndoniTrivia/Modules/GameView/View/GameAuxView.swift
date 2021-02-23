//
//  GameAuxView.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import UIKit

final class GameAuxView: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: TriviaButton!
    
    var playerName: String?
    var router: GameAuxRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLang()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        self.router?.dismiss(formView: self)
    }
}

// MARK: - Front
private extension GameAuxView {
    
    func setupLang() {
        label.text = NSLocalizedString("your_turn", comment: "").replacingOccurrences(of: "{$0}", with: playerName ?? "")
        button.setTitle(NSLocalizedString("ready", comment: ""), for: .normal)
    }
}

// MARK: - View
extension GameAuxView: GameAuxViewProtocol {
    
    
}
