//
//  TableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 03.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    lazy var  numberOfCardTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "№ карты:"
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var  numberOfCardLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "дата:"
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var diagnosisTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "диагноз:"
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var diagnosisLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTitleLabel:UILabel = {
        let label = UILabel()
        label.text = "ФИО:"
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewModel: MainCellViewModelType! {
        didSet {
            self.numberOfCardLabel.text = viewModel.numberOfCard
            self.dateLabel.text = viewModel.date
            self.diagnosisLabel.text = viewModel.diagnosis
            self.nameLabel.text = viewModel.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        selectionStyle = .none
        self.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)

        self.contentView.addSubview(numberOfCardLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(diagnosisLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(numberOfCardTitleLabel)
        self.contentView.addSubview(dateTitleLabel)
        self.contentView.addSubview(diagnosisTitleLabel)
        self.contentView.addSubview(nameTitleLabel)
        
        numberOfCardTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        numberOfCardTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        numberOfCardLabel.topAnchor.constraint(equalTo: numberOfCardTitleLabel.topAnchor).isActive = true
        numberOfCardLabel.leftAnchor.constraint(equalTo: numberOfCardTitleLabel.rightAnchor, constant: 10).isActive = true
        
        //------------------------------------------------------------------
        
        dateTitleLabel.topAnchor.constraint(equalTo: numberOfCardTitleLabel.bottomAnchor, constant: 5).isActive = true
        dateTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: dateTitleLabel.topAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: dateTitleLabel.rightAnchor, constant: 10).isActive = true
        
        //------------------------------------------------------------------

        diagnosisTitleLabel.topAnchor.constraint(equalTo: dateTitleLabel.bottomAnchor, constant: 5).isActive = true
        diagnosisTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        
        diagnosisLabel.topAnchor.constraint(equalTo: diagnosisTitleLabel.topAnchor).isActive = true
        diagnosisLabel.leftAnchor.constraint(equalTo: diagnosisTitleLabel.rightAnchor, constant: 10).isActive = true
        
        //------------------------------------------------------------------
        
        nameTitleLabel.topAnchor.constraint(equalTo: diagnosisTitleLabel.bottomAnchor, constant: 5).isActive = true
        nameTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        nameTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        nameLabel.topAnchor.constraint(equalTo: nameTitleLabel.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: nameTitleLabel.rightAnchor, constant: 10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
