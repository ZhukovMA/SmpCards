//
//  CardDateTableViewCell.swift
//  SmpCard
//
//  Created by Максим Жуков on 22.12.2020.
//  Copyright © 2020 SMP. All rights reserved.
//

import UIKit

class CardDateTableViewCell: UITableViewCell {
    
    var viewModel: CardTextCellViewModelType? {
        didSet {
            self.attributeLabel.text = viewModel?.getTitle()
            if let text = viewModel?.getAttributeData() {
                self.dateLabel.text = text
            }
        }
    }
    
    
    let attributeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 18)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
 
    
    override init(style: UITableViewCell.CellStyle,  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(attributeLabel)

        selectionStyle = .none
        attributeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        attributeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: attributeLabel.bottomAnchor, constant: 10).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
