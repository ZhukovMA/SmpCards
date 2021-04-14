//
//  NameTableViewCell.swift
//  SMPCards
//
//  Created by Максим Жуков on 09.11.2020.
//  Copyright © 2020 Максим Жуков. All rights reserved.
//

import UIKit

protocol Output: class {
    func didChangeText(str: String , indexPathRow: Int)
    func textViewShouldBeginEditing( firstResponderView: UIView)
}

class CardTextAttributeTableViewCell: UITableViewCell {

    var delegate: Output?
    
    private let attributeLabelHeight: CGFloat = 30.0
    private let topMargin: CGFloat = 5.0
    private let undelineHeight: CGFloat = 0.5
    private let inset: CGFloat = 10.0
    
    var indexPathRow: Int!
    
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
        label.textColor = #colorLiteral(red: 0.6887513399, green: 0.6846590638, blue: 0.6918982863, alpha: 1)
        label.font = UIFont(name: "Verdana", size: 18)
        return label
    }()
    
    var limitLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.7044070363, green: 0.7002216578, blue: 0.7076256275, alpha: 1)
        return label
    }()
    
    
    lazy var complaintsTextView : UITextView = {
        let textView = UITextView()
        textView.textContainerInset =  .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.textColor = #colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 1)
        textView.delegate = self
        textView.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        textView.font = UIFont(name: "Verdana", size: 16)
        return textView
    }()
    
    lazy var underTextViewLabel:UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.3422456086, green: 0.3402163684, blue: 0.3438087702, alpha: 1)
        label.font = UIFont(name: "Verdana", size: 16)
        label.text = "Введите данные"
        
        label.numberOfLines = 0
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
    
    
    
    let undeline: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3422456086, green: 0.3402163684, blue: 0.3438087702, alpha: 1)
        return view
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.06691879034, green: 0.06652892381, blue: 0.06722356379, alpha: 1)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle,  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)

        
        
        self.contentView.addSubview(complaintsTextView)
        self.contentView.addSubview(underTextViewLabel)
        self.contentView.addSubview(attributeLabel)
        self.contentView.addSubview(undeline)
        self.contentView.addSubview(limitLabel)
        self.contentView.addSubview(headerView)
        let width = UIScreen.main.bounds.width

        
        headerView.frame = CGRect(x: 0, y: 0, width: width, height: 5)
        attributeLabel.frame = CGRect(x: 7, y: headerView.frame.maxY, width: width, height: attributeLabel.font.lineHeight + 10)
        undeline.frame = CGRect(x: 7, y: attributeLabel.frame.maxY, width: width, height: 0.5)
        
        addDoneButtonOnKeyboard()
        selectionStyle = .none

        
        complaintsTextView.isScrollEnabled = false
//        complaintsTextView.frame = CGRect(x: 7, y: undeline.frame.maxY, width: UIScreen.main.bounds.width - 7-7, height: 100)
        underTextViewLabel.frame = complaintsTextView.frame
        
        let fixedWidth = complaintsTextView.frame.size.width
        let newSize = complaintsTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        complaintsTextView.frame.size = CGSize(width: UIScreen.main.bounds.width - 7 - 7, height: newSize.height)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {

        let fixedWidth = complaintsTextView.frame.size.width
        let newSize = complaintsTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        complaintsTextView.frame.size = CGSize(width: UIScreen.main.bounds.width - 7 - 7, height: newSize.height)
        complaintsTextView.frame.origin.y = undeline.frame.maxY + inset
        complaintsTextView.frame.origin.x = 7
        return CGSize(width: UIScreen.main.bounds.width, height: self.headerView.frame.size.height + attributeLabelHeight + undelineHeight + inset  + complaintsTextView.contentSize.height + inset )
    }
}

extension CardTextAttributeTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if let limit = viewModel?.getLimitOfText() {
            limitLabel.text = "\(limit - textView.text.count)"
        }
        delegate?.didChangeText(str: textView.text, indexPathRow: indexPathRow)
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
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        delegate?.textViewShouldBeginEditing(firstResponderView: textView)
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if let limit = viewModel?.getLimitOfText() {
            limitLabel.text = "\(limit - textView.text.count)"
        }
        if underTextViewLabel.textColor ==  #colorLiteral(red: 0.7019971013, green: 0.6978260875, blue: 0.7052046657, alpha: 1) {
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
            underTextViewLabel.textColor = #colorLiteral(red: 0.3422456086, green: 0.3402163684, blue: 0.3438087702, alpha: 1)
        }
    }
}
