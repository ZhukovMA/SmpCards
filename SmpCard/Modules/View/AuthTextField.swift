//
//  AuthTextField.swift
//  SmpCard
//
//  Created by Максим Жуков on 01.01.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

class AuthTextField: UITextField {

    private let border = UIView()
    

    override func layoutSubviews() {
        super.layoutSubviews()
        border.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        borderStyle = .none
        addSubview(border)
        //        backgroundColor = .clear
        border.backgroundColor = #colorLiteral(red: 0.3563902974, green: 0.3923808932, blue: 0.4337128997, alpha: 1)
        addTarget(self, action: #selector(handleEditingBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(handleEditingEnd), for: .editingDidEnd)

    }

    @objc
    private func handleEditingEnd() {
        UIView.animate(withDuration: 0.2) {
            self.border.backgroundColor  = #colorLiteral(red: 0.3563902974, green: 0.3923808932, blue: 0.4337128997, alpha: 1)
        }
    }
    
    @objc
    private func handleEditingBegin() {
        UIView.animate(withDuration: 0.2) {
            self.border.backgroundColor = #colorLiteral(red: 0.5498703122, green: 0.5466050506, blue: 0.552382648, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
