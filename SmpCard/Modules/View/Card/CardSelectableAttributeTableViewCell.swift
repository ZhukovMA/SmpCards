//
//  3TableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 15.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class CardSelectableAttributeTableViewCell: UITableViewCell {
    
    var viewModel: CardSelectableCellViewModelType? {
        didSet {
            self.attributeLabel.text = viewModel?.getTitle()
            if let text = viewModel?.getAttributeData(), !text.isEmpty {
                self.attributeDataLabel.text = text
            } else {
                attributeDataLabel.text = " "
            }
            attributeDataLabel.font = UIFont(name: "Verdana", size: viewModel!.shouldReduceFont ? 14 :16)

        }
    }
    
    let attributeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 18)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let associatedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let attributeDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        attributeDataLabel.text = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(attributeLabel)
        self.contentView.addSubview(attributeDataLabel)
        self.contentView.addSubview(associatedView)
        self.contentView.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
        selectionStyle = .none

        
        associatedView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        associatedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        associatedView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        associatedView.widthAnchor.constraint(equalToConstant: 6).isActive = true

        
        attributeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        attributeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7).isActive = true
        
        attributeDataLabel.topAnchor.constraint(equalTo: attributeLabel.bottomAnchor, constant: 15).isActive = true
        attributeDataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        attributeDataLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        attributeDataLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
