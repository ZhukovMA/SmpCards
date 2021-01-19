//
//  AdditionalTextTableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 17.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

protocol AdditionalTextTableViewCellDelegate {
    func didChangeText(str: String ,indxPathRow: Int)
}

class AdditionalTextTableViewCell: UITableViewCell {
    
    var delegate: AdditionalTextTableViewCellDelegate?

    var indexPath: IndexPath!
    
    
    var cs = 0
    var viewModel: AdditionalTextCellViewModelType? {
        didSet {
            if let vm = viewModel {
                self.attributeLabel.text = vm.getTitle()
                if let text = vm.getText() {
                    self.dataTextView.text = text
                    underTextViewLabel.text = nil
                } else {
                    underTextViewLabel.text = "Введите данные"
                }
                if vm.isNumbericKeyboard() {
                    dataTextView.keyboardType = .numbersAndPunctuation
                } else {
                    dataTextView.keyboardType = .default
                }
            }
        }
    }
    var limitLabel : UILabel = {
         let label = UILabel()
         label.textColor = #colorLiteral(red: 0.7019971013, green: 0.6978260875, blue: 0.7052046657, alpha: 0.2133722175)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    let attributeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 18)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var underTextViewLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7019971013, green: 0.6978260875, blue: 0.7052046657, alpha: 0.2133722175)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dataTextView : UITextView = {
        let textView = UITextView()
        textView.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textView.delegate = self
        textView.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
        textView.font = UIFont(name: "Verdana", size: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        dataTextView.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction(){
        dataTextView.resignFirstResponder()
        let _text = dataTextView.text.isEmpty ? nil : dataTextView.text
        viewModel?.sendText(text: _text, section: indexPath.section)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dataTextView.text = nil
        underTextViewLabel.text = "Введите данные"
    }
    
    override init(style: UITableViewCell.CellStyle,  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(dataTextView)
        self.contentView.addSubview(underTextViewLabel)
        self.contentView.addSubview(attributeLabel)
        self.contentView.addSubview(limitLabel)

        addDoneButtonOnKeyboard()
        selectionStyle = .none
        self.backgroundColor = #colorLiteral(red: 0.1566217244, green: 0.1594332755, blue: 0.1943226159, alpha: 1)
        attributeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        attributeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7).isActive = true
        attributeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7).isActive = true
        
        dataTextView.isScrollEnabled = false
        dataTextView.topAnchor.constraint(equalTo: attributeLabel.bottomAnchor).isActive = true
        dataTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        dataTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7).isActive = true
        dataTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7).isActive = true
        
        underTextViewLabel.topAnchor.constraint(equalTo: dataTextView.topAnchor).isActive = true
        underTextViewLabel.bottomAnchor.constraint(equalTo: dataTextView.bottomAnchor).isActive = true
        underTextViewLabel.leadingAnchor.constraint(equalTo: dataTextView.leadingAnchor).isActive = true
        underTextViewLabel.trailingAnchor.constraint(equalTo: dataTextView.trailingAnchor).isActive = true
        
        limitLabel.bottomAnchor.constraint(equalTo: dataTextView.topAnchor).isActive = true
        limitLabel.rightAnchor.constraint(equalTo: dataTextView.rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AdditionalTextTableViewCell: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        if let limit = viewModel?.getLimitOfText() {
            limitLabel.text = "\(limit - textView.text.count)"
        }
        delegate?.didChangeText(str: textView.text, indxPathRow: indexPath.row)
        let _text = textView.text.isEmpty ? nil : dataTextView.text
        viewModel?.sendText(text: _text, section: indexPath.section)
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

