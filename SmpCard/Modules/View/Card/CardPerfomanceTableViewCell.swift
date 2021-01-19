//
//  CardPerfomanceTableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 30.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

class CardPerfomanceTableViewCell: UITableViewCell {
    
    var delegate: Output?
    
    var indexPath: IndexPath!
    

    
    var cs = 0
    var viewModel: CardPerfomanceCellViewModelType? {
        didSet {
            self.attributeLabel.text = viewModel?.getTitle()
            self.attributeADBeforeDataLabel.text = viewModel?.getPerfomance(forSubattribute: .adBeforeMedHelp)
            self.attributeADAfterDataLabel.text = viewModel?.getPerfomance(forSubattribute: .adAfterMedHelp)
            self.attributeCHSSBeforeDataLabel.text = viewModel?.getPerfomance(forSubattribute: .chssBeforeMedHelp)
            self.attributeCHSSAfterDataLabel.text = viewModel?.getPerfomance(forSubattribute: .chssAfterMedHelp)
            self.attributePBeforeDataLabel.text = viewModel?.getPerfomance(forSubattribute: .pBeforeMedHelp)
            self.attributePAfterDataLabel.text = viewModel?.getPerfomance(forSubattribute: .pAfterMedHelp)
            self.attributeCHDDBeforeDataLabel.text = viewModel?.getPerfomance(forSubattribute: .chddBeforeMedHelp)
            self.attributeCHDDAfterDataLabel.text = viewModel?.getPerfomance(forSubattribute: .chddAfterMedHelp)
            self.attributeTBeforeDataLabel.text = viewModel?.getPerfomance(forSubattribute: .tBeforeMedHelp)
            self.attributeTAfterDataLabel.text = viewModel?.getPerfomance(forSubattribute: .tAfterMedHelp)
            self.attributeSpOBeforeDataLabel.text = viewModel?.getPerfomance(forSubattribute: .spOBeforeMedHelp)
            self.attributeSpOAfterDataLabel.text = viewModel?.getPerfomance(forSubattribute: .spOAfterMedHelp)
            self.attributeGlukozaBeforeDataLabel.text = viewModel?.getPerfomance(forSubattribute: .glukozaBeforeMedHelp)
            self.attributeGlukozaAfterDataLabel.text = viewModel?.getPerfomance(forSubattribute: .glukozaAfterMedHelp)
        }
    }
    
    
    
    let attributeLabel : UILabel = {
        let label = UILabel()
        //        label.layer.borderColor = UIColor.darkGray.cgColor
        //        label.layer.borderWidth = 3.0
        label.font = UIFont(name: "Verdana", size: 18)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let beforeLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "До"
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let afterLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "После"
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let adLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Ад/мм.рт.ст."
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeADBeforeDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeADAfterDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let CHSSLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "ЧСС/мин."
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeCHSSBeforeDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeCHSSAfterDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let pLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "P/мин."
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributePBeforeDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributePAfterDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let CHDDLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "ЧДД/мин."
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeCHDDBeforeDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeCHDDAfterDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let TLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "T/°С"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeTBeforeDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeTAfterDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let saturationLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "SpO₂/%."
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeSpOBeforeDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeSpOAfterDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let glukozaLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Глюкоза/ммоль/л"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 14)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeGlukozaBeforeDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let attributeGlukozaAfterDataLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let columnLineLeft: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let columnLineRight: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rowLineUnderBeforAfter: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rowLineUnderAd: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rowLineUnderChss: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rowLineUnderP: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rowLineUnderChdd: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rowLineUnderT: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rowLineUnderSpo: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupGrid() {
        columnLineLeft.topAnchor.constraint(equalTo: beforeLabel.topAnchor).isActive = true
        columnLineLeft.widthAnchor.constraint(equalToConstant: 1).isActive = true
        columnLineLeft.leftAnchor.constraint(equalTo: adLabel.rightAnchor).isActive = true
        columnLineLeft.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3).isActive = true

        columnLineRight.topAnchor.constraint(equalTo: beforeLabel.topAnchor).isActive = true
        columnLineRight.widthAnchor.constraint(equalToConstant: 1).isActive = true
        columnLineRight.leftAnchor.constraint(equalTo: afterLabel.leftAnchor).isActive = true
        columnLineRight.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3).isActive = true
        
        rowLineUnderBeforAfter.topAnchor.constraint(equalTo: beforeLabel.bottomAnchor).isActive = true
        rowLineUnderBeforAfter.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rowLineUnderBeforAfter.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        rowLineUnderBeforAfter.rightAnchor.constraint(equalTo: afterLabel.rightAnchor).isActive = true
        
        rowLineUnderAd.topAnchor.constraint(equalTo: adLabel.bottomAnchor).isActive = true
        rowLineUnderAd.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rowLineUnderAd.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        rowLineUnderAd.rightAnchor.constraint(equalTo: afterLabel.rightAnchor).isActive = true
        
        rowLineUnderChss.topAnchor.constraint(equalTo: CHSSLabel.bottomAnchor).isActive = true
        rowLineUnderChss.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rowLineUnderChss.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        rowLineUnderChss.rightAnchor.constraint(equalTo: afterLabel.rightAnchor).isActive = true
        
        rowLineUnderP.topAnchor.constraint(equalTo: pLabel.bottomAnchor).isActive = true
        rowLineUnderP.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rowLineUnderP.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        rowLineUnderP.rightAnchor.constraint(equalTo: afterLabel.rightAnchor).isActive = true
        
        rowLineUnderChdd.topAnchor.constraint(equalTo: CHDDLabel.bottomAnchor).isActive = true
        rowLineUnderChdd.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rowLineUnderChdd.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        rowLineUnderChdd.rightAnchor.constraint(equalTo: afterLabel.rightAnchor).isActive = true
        
        rowLineUnderT.topAnchor.constraint(equalTo: TLabel.bottomAnchor).isActive = true
        rowLineUnderT.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rowLineUnderT.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        rowLineUnderT.rightAnchor.constraint(equalTo: afterLabel.rightAnchor).isActive = true
        
        rowLineUnderSpo.topAnchor.constraint(equalTo: saturationLabel.bottomAnchor).isActive = true
        rowLineUnderSpo.heightAnchor.constraint(equalToConstant: 1).isActive = true
        rowLineUnderSpo.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        rowLineUnderSpo.rightAnchor.constraint(equalTo: afterLabel.rightAnchor).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle,  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
        
        self.contentView.addSubview(attributeLabel)
        self.contentView.addSubview(beforeLabel)
        self.contentView.addSubview(afterLabel)
        self.contentView.addSubview(adLabel)
        self.contentView.addSubview(attributeADBeforeDataLabel)
        self.contentView.addSubview(attributeADAfterDataLabel)
        self.contentView.addSubview(CHSSLabel)
        self.contentView.addSubview(attributeCHSSBeforeDataLabel)
        self.contentView.addSubview(attributeCHSSAfterDataLabel)
        self.contentView.addSubview(pLabel)
        self.contentView.addSubview(attributePBeforeDataLabel)
        self.contentView.addSubview(attributePAfterDataLabel)
        self.contentView.addSubview(CHDDLabel)
        self.contentView.addSubview(attributeCHDDBeforeDataLabel)
        self.contentView.addSubview(attributeCHDDAfterDataLabel)
        self.contentView.addSubview(TLabel)
        self.contentView.addSubview(attributeTBeforeDataLabel)
        self.contentView.addSubview(attributeTAfterDataLabel)
        self.contentView.addSubview(saturationLabel)
        self.contentView.addSubview(attributeSpOBeforeDataLabel)
        self.contentView.addSubview(attributeSpOAfterDataLabel)
        self.contentView.addSubview(glukozaLabel)
        self.contentView.addSubview(attributeGlukozaBeforeDataLabel)
        self.contentView.addSubview(attributeGlukozaAfterDataLabel)
        self.contentView.addSubview(columnLineLeft)
        self.contentView.addSubview(columnLineRight)
        self.contentView.addSubview(rowLineUnderP)
        self.contentView.addSubview(rowLineUnderT)
        self.contentView.addSubview(rowLineUnderAd)
        self.contentView.addSubview(rowLineUnderSpo)
        self.contentView.addSubview(rowLineUnderChdd)
        self.contentView.addSubview(rowLineUnderChss)
        self.contentView.addSubview(rowLineUnderBeforAfter)
        
        selectionStyle = .none
        attributeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        attributeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7).isActive = true
        
        beforeLabel.topAnchor.constraint(equalTo: attributeLabel.bottomAnchor, constant: 10).isActive = true
        beforeLabel.leftAnchor.constraint(equalTo: adLabel.rightAnchor).isActive = true
        beforeLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        beforeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        afterLabel.topAnchor.constraint(equalTo: attributeLabel.bottomAnchor, constant: 10).isActive = true
        afterLabel.leftAnchor.constraint(equalTo: beforeLabel.rightAnchor).isActive = true
        afterLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        afterLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        adLabel.topAnchor.constraint(equalTo: beforeLabel.bottomAnchor).isActive = true
        adLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        adLabel.widthAnchor.constraint(equalToConstant: 135).isActive = true
        adLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        attributeADBeforeDataLabel.topAnchor.constraint(equalTo: adLabel.topAnchor).isActive = true
        attributeADBeforeDataLabel.centerXAnchor.constraint(equalTo: beforeLabel.centerXAnchor).isActive = true
        attributeADBeforeDataLabel.centerYAnchor.constraint(equalTo: adLabel.centerYAnchor).isActive = true
        attributeADAfterDataLabel.topAnchor.constraint(equalTo: adLabel.topAnchor).isActive = true
        attributeADAfterDataLabel.centerXAnchor.constraint(equalTo: afterLabel.centerXAnchor).isActive = true
        attributeADAfterDataLabel.centerYAnchor.constraint(equalTo: adLabel.centerYAnchor).isActive = true

        CHSSLabel.topAnchor.constraint(equalTo: adLabel.bottomAnchor).isActive = true
        CHSSLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        CHSSLabel.rightAnchor.constraint(equalTo: adLabel.rightAnchor).isActive = true
        CHSSLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        attributeCHSSBeforeDataLabel.topAnchor.constraint(equalTo: CHSSLabel.topAnchor).isActive = true
        attributeCHSSBeforeDataLabel.centerXAnchor.constraint(equalTo: beforeLabel.centerXAnchor).isActive = true
        attributeCHSSBeforeDataLabel.centerYAnchor.constraint(equalTo: CHSSLabel.centerYAnchor).isActive = true

        attributeCHSSAfterDataLabel.topAnchor.constraint(equalTo: CHSSLabel.topAnchor).isActive = true
        attributeCHSSAfterDataLabel.centerXAnchor.constraint(equalTo: afterLabel.centerXAnchor).isActive = true
        attributeCHSSAfterDataLabel.centerYAnchor.constraint(equalTo: CHSSLabel.centerYAnchor).isActive = true

        
        pLabel.topAnchor.constraint(equalTo: CHSSLabel.bottomAnchor).isActive = true
        pLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pLabel.rightAnchor.constraint(equalTo: adLabel.rightAnchor).isActive = true
        pLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        attributePBeforeDataLabel.topAnchor.constraint(equalTo: pLabel.topAnchor).isActive = true
        attributePBeforeDataLabel.centerXAnchor.constraint(equalTo: beforeLabel.centerXAnchor).isActive = true
        attributePBeforeDataLabel.centerYAnchor.constraint(equalTo: pLabel.centerYAnchor).isActive = true
        attributePAfterDataLabel.topAnchor.constraint(equalTo: pLabel.topAnchor).isActive = true
        attributePAfterDataLabel.centerXAnchor.constraint(equalTo: afterLabel.centerXAnchor).isActive = true
        attributePAfterDataLabel.centerYAnchor.constraint(equalTo: pLabel.centerYAnchor).isActive = true
        
        CHDDLabel.topAnchor.constraint(equalTo: pLabel.bottomAnchor).isActive = true
        CHDDLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        CHDDLabel.rightAnchor.constraint(equalTo: adLabel.rightAnchor).isActive = true
        CHDDLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        attributeCHDDBeforeDataLabel.topAnchor.constraint(equalTo: CHDDLabel.topAnchor).isActive = true
        attributeCHDDBeforeDataLabel.centerXAnchor.constraint(equalTo: beforeLabel.centerXAnchor).isActive = true
        attributeCHDDBeforeDataLabel.centerYAnchor.constraint(equalTo: CHDDLabel.centerYAnchor).isActive = true
        attributeCHDDAfterDataLabel.topAnchor.constraint(equalTo: CHDDLabel.topAnchor).isActive = true
        attributeCHDDAfterDataLabel.centerXAnchor.constraint(equalTo: afterLabel.centerXAnchor).isActive = true
        attributeCHDDAfterDataLabel.centerYAnchor.constraint(equalTo: CHDDLabel.centerYAnchor).isActive = true
        
        TLabel.topAnchor.constraint(equalTo: CHDDLabel.bottomAnchor).isActive = true
        TLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        TLabel.rightAnchor.constraint(equalTo: adLabel.rightAnchor).isActive = true
        TLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        attributeTBeforeDataLabel.topAnchor.constraint(equalTo: TLabel.topAnchor).isActive = true
        attributeTBeforeDataLabel.centerXAnchor.constraint(equalTo: beforeLabel.centerXAnchor).isActive = true
        attributeTBeforeDataLabel.centerYAnchor.constraint(equalTo: TLabel.centerYAnchor).isActive = true
        attributeTAfterDataLabel.topAnchor.constraint(equalTo: TLabel.topAnchor).isActive = true
        attributeTAfterDataLabel.centerXAnchor.constraint(equalTo: afterLabel.centerXAnchor).isActive = true
        attributeTAfterDataLabel.centerYAnchor.constraint(equalTo: TLabel.centerYAnchor).isActive = true
        
        saturationLabel.topAnchor.constraint(equalTo: TLabel.bottomAnchor).isActive = true
        saturationLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        saturationLabel.rightAnchor.constraint(equalTo: adLabel.rightAnchor).isActive = true
        saturationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        attributeSpOBeforeDataLabel.topAnchor.constraint(equalTo: saturationLabel.topAnchor).isActive = true
        attributeSpOBeforeDataLabel.centerXAnchor.constraint(equalTo: beforeLabel.centerXAnchor).isActive = true
        attributeSpOBeforeDataLabel.centerYAnchor.constraint(equalTo: saturationLabel.centerYAnchor).isActive = true
        attributeSpOAfterDataLabel.topAnchor.constraint(equalTo: saturationLabel.topAnchor).isActive = true
        attributeSpOAfterDataLabel.centerXAnchor.constraint(equalTo: afterLabel.centerXAnchor).isActive = true
        attributeSpOAfterDataLabel.centerYAnchor.constraint(equalTo: saturationLabel.centerYAnchor).isActive = true
        
        glukozaLabel.topAnchor.constraint(equalTo: saturationLabel.bottomAnchor).isActive = true
        glukozaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        glukozaLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        glukozaLabel.rightAnchor.constraint(equalTo: adLabel.rightAnchor).isActive = true
        glukozaLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        attributeGlukozaBeforeDataLabel.topAnchor.constraint(equalTo: glukozaLabel.topAnchor).isActive = true
        attributeGlukozaBeforeDataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        attributeGlukozaBeforeDataLabel.centerXAnchor.constraint(equalTo: beforeLabel.centerXAnchor).isActive = true
        attributeGlukozaBeforeDataLabel.centerYAnchor.constraint(equalTo: glukozaLabel.centerYAnchor).isActive = true
        attributeGlukozaAfterDataLabel.topAnchor.constraint(equalTo: glukozaLabel.topAnchor).isActive = true
        attributeGlukozaAfterDataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        attributeGlukozaAfterDataLabel.centerXAnchor.constraint(equalTo: afterLabel.centerXAnchor).isActive = true
        attributeGlukozaAfterDataLabel.centerYAnchor.constraint(equalTo: glukozaLabel.centerYAnchor).isActive = true

        
        setupGrid()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
