//
//  TableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 17.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class AdditionalSelectableTableViewCell: UITableViewCell {

    var viewModel: AdditionalSelectableCellViewModelType? {
        didSet {
            attributeLabel.text = viewModel?.getTitle()
        }
    }
   
    let attributeLabel : UILabel = {
         let label = UILabel()
         label.font = UIFont(name: "Verdana", size: 20)
         label.textColor = #colorLiteral(red: 0.9294968247, green: 0.9296525121, blue: 0.9294763207, alpha: 1)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    override init(style: UITableViewCell.CellStyle,  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(attributeLabel)
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.2180472314, green: 0.3175804615, blue: 0.3693208098, alpha: 1)
        self.selectedBackgroundView =  backgroundView
        self.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
        self.layoutMargins = UIEdgeInsets.zero

        contentView.heightAnchor.constraint(equalToConstant: 70).isActive = true

//        contentView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        attributeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        attributeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        attributeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
