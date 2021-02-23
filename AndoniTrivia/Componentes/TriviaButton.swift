//
//  TriviaButton.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 8/1/21.
//

import UIKit

final class TriviaButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        self.layer.cornerRadius = 2
        backgroundColor = UIColor(named: "mainButtonColor")
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        let tColor = UIColor(named: "mainBackgroundColoe")
        setTitleColor(tColor, for: .normal)
    }
}
