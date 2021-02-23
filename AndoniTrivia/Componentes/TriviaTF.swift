//
//  TriviaTF.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 8/1/21.
//

import UIKit

final class TriviaTF: UITextField {

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
        backgroundColor = UIColor(named: "mainColor")
        let tColor = UIColor(named: "mainButtonColor")
        autocapitalizationType = .none
        autocorrectionType = .no
        textColor = tColor
    }
}
