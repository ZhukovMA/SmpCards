//
//  NameTableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 09.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

protocol Output {
    func didChangeText(str: String , indexPath: IndexPath)
}

class CardTextAttributeTableViewCell: UITableViewCell {
    
    var delegate: Output?
    
    var indexPath: IndexPath!
    
    var viewModel: CardTextCellViewModelType? {
        didSet {
            self.attributeLabel.text = viewModel?.getTitle()
            if let text = viewModel?.getAttributeData() {
                self.complaintsTextView.text = text
            } else {
                self.underTextViewLabel.text = viewModel?.getTitle()
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        complaintsTextView.text = nil
        underTextViewLabel.text = nil
        limitLabel.text = nil
    }
    
    let attributeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 18)
        label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var limitLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7044070363, green: 0.7002216578, blue: 0.7076256275, alpha: 0.4765089898)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var complaintsTextView : UITextView = {
        let textView = UITextView()
        textView.textContainerInset =  .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.textColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        textView.delegate = self
        textView.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
        textView.font = UIFont(name: "Verdana", size: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var underTextViewLabel:UILabel = {
          let label = UILabel()
          label.textColor = #colorLiteral(red: 0.7019971013, green: 0.6978260875, blue: 0.7052046657, alpha: 0.2133722175)
        label.font = UIFont(name: "Verdana", size: 16)

          label.numberOfLines = 0
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        complaintsTextView.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction(){
        complaintsTextView.resignFirstResponder()
    }
    
    
    override init(style: UITableViewCell.CellStyle,  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
        self.contentView.addSubview(complaintsTextView)
        self.contentView.addSubview(underTextViewLabel)
        self.contentView.addSubview(attributeLabel)
        self.contentView.addSubview(limitLabel)

        addDoneButtonOnKeyboard()
        selectionStyle = .none
        attributeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        attributeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7).isActive = true
        
        complaintsTextView.isScrollEnabled = false
        complaintsTextView.topAnchor.constraint(equalTo: attributeLabel.bottomAnchor, constant: 10).isActive = true
        complaintsTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        complaintsTextView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7).isActive = true
        complaintsTextView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        
        
        underTextViewLabel.topAnchor.constraint(equalTo: complaintsTextView.topAnchor).isActive = true
        underTextViewLabel.bottomAnchor.constraint(equalTo: complaintsTextView.bottomAnchor).isActive = true
        underTextViewLabel.leftAnchor.constraint(equalTo: complaintsTextView.leftAnchor).isActive = true
        underTextViewLabel.rightAnchor.constraint(equalTo: complaintsTextView.rightAnchor).isActive = true
        
        limitLabel.bottomAnchor.constraint(equalTo: complaintsTextView.topAnchor).isActive = true
        limitLabel.rightAnchor.constraint(equalTo: complaintsTextView.rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardTextAttributeTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if let limit = viewModel?.getLimitOfText() {
            limitLabel.text = "\(limit - textView.text.count)"
        }
        delegate?.didChangeText(str: textView.text, indexPath: indexPath)
        viewModel?.sendData(data: &textView.text)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let limit = viewModel?.getLimitOfText() {
            if limit == textView.text.count, !text.isEmpty {
                return false
            }
        }
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if let limit = viewModel?.getLimitOfText() {
            limitLabel.text = "\(limit - textView.text.count)"
        }
        if underTextViewLabel.textColor ==  #colorLiteral(red: 0.7019971013, green: 0.6978260875, blue: 0.7052046657, alpha: 0.2133722175) {
            underTextViewLabel.text = nil
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        limitLabel.text = nil
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            limitLabel.text = nil
            underTextViewLabel.text = "Введите данные"
            underTextViewLabel.textColor = #colorLiteral(red: 0.7019971013, green: 0.6978260875, blue: 0.7052046657, alpha: 0.2133722175)
        }
    }
}
