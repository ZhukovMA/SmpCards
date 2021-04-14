//
//  PatternTableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 08.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit



    

class PatternsTableViewCell: UITableViewCell {

    
    lazy var diagnosisLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 20)
        label.textColor = #colorLiteral(red: 0.9294968247, green: 0.9296525121, blue: 0.9294763207, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var viewModel: PatternsCellViewModelType? {
        didSet {
            self.diagnosisLabel.text = viewModel?.diagnosis
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.contentView.addSubview(diagnosisLabel)
   
        self.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        diagnosisLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        diagnosisLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
//        diagnosisLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true

        diagnosisLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        diagnosisLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
