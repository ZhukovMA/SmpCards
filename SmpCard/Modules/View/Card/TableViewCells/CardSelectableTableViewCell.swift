//
//  CardMultiTableViewCell.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 05.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//


import UIKit

class CardSelectableTableViewCell: UITableViewCell {
    var indexPath: IndexPath!
    var delegate: Output?
    var indexPathRow: Int!
    
    var viewModel: CardSelectableCellViewModelType? {
        didSet {
            guard let vm = viewModel else { return }
            self.collectionView.viewModel = vm.selectableField
            self.attributeLabel.text = vm.getTitle()
           
        }
    }
    private let attributeLabelHeight: CGFloat = 30.0
    private let topMargin: CGFloat = 5.0
    private let undelineHeight: CGFloat = 0.5
    private let inset: CGFloat = 10.0
    

    let attributeLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.8073702455, green: 0.8025718331, blue: 0.8110593557, alpha: 1)
        
        label.font = UIFont(name: "Verdana", size: 18)
        return label
    }()
    
    
    
    let customContentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMinYCorner]
        view.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        return view
    }()
    
    lazy var collectionView: SectableField = {
        let cv = SectableField()
        cv.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        return cv
    }()
    
    let detailLabel:  UILabel  = {
       let label = UILabel()
       label.textColor = #colorLiteral(red: 0.7801750302, green: 0.7755385041, blue: 0.7837398648, alpha: 1)
       label.text = "Детально: "
       return label
   }()
   
    let underTextViewLabel: UILabel = {
       let label = UILabel()
       label.textColor = #colorLiteral(red: 0.3422456086, green: 0.3402163684, blue: 0.3438087702, alpha: 1)
       label.text = "Введите данные"
       label.font = UIFont(name: "Verdana", size: 16)
       label.numberOfLines = 0
       return label
   }()
   
   lazy var complaintsTextView: UITextView = {
       let textView = UITextView()
       textView.textContainerInset =  .zero
       textView.textContainer.lineFragmentPadding = 0
       textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       textView.delegate = self
       textView.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
       textView.font = UIFont(name: "Verdana", size: 16)
       return textView
   }()
   
    let limitLabel: UILabel = {
       let label = UILabel()
       label.textColor = #colorLiteral(red: 0.7044070363, green: 0.7002216578, blue: 0.7076256275, alpha: 1)
       label.font = UIFont(name: "Verdana", size: 16)
       return label
   }()
    
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        let width = UIScreen.main.bounds.width
        
        contentView.addSubview(headerView)
        contentView.addSubview(attributeLabel)
        contentView.addSubview(undeline)
        contentView.addSubview(collectionView)
        
        headerView.frame = CGRect(x: 0, y: 0, width: width, height: 5)
        attributeLabel.frame = CGRect(x: 7, y:  headerView.frame.maxY, width: width, height:  attributeLabel.font.lineHeight + 10)
        undeline.frame = CGRect(x: 7, y: attributeLabel.frame.maxY, width: width, height: 0.5)
        collectionView.frame = CGRect(x: 7, y:  undeline.frame.maxY + inset, width: UIScreen.main.bounds.width - 7 - 7, height: 1)

    }
    
  
    private func addAdditionalTextField() {
        let sdditionalTextFieldInset = 3*inset
        self.contentView.addSubview(detailLabel)
        self.contentView.addSubview(complaintsTextView)
        self.contentView.addSubview( underTextViewLabel)
        self.contentView.addSubview(limitLabel)
        
        detailLabel.frame = CGRect(x: 20, y: collectionView.frame.maxY + sdditionalTextFieldInset, width: 80, height: detailLabel.font.lineHeight)
        addDoneButtonOnKeyboard(complaintsTextView)
        
        complaintsTextView.isScrollEnabled = false
        complaintsTextView.frame = CGRect(x: detailLabel.frame.maxX + 10, y: collectionView.frame.maxY + sdditionalTextFieldInset, width: 300, height: detailLabel.font.lineHeight)
        underTextViewLabel.frame = complaintsTextView.frame
        limitLabel.frame = CGRect(x: complaintsTextView.frame.maxX - 20.0, y: complaintsTextView.frame.origin.y - 30, width: 20, height: 20)
    }
    
    
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {

        self.contentView.frame = self.bounds
        self.contentView.layoutIfNeeded()
        var heightOfDetailLabel: CGFloat = 0.0
        collectionView.frame = CGRect(x: 7, y: undeline.frame.maxY + inset, width: UIScreen.main.bounds.width - 7 - 7, height: self.collectionView.contentSize.height)

        if viewModel!.hasAdditionalTextField {
            heightOfDetailLabel = detailLabel.font.lineHeight + 3*inset
            addAdditionalTextField()
        }
        return  CGSize(width: UIScreen.main.bounds.width, height: self.headerView.frame.size.height + attributeLabelHeight + undelineHeight + inset + self.collectionView.contentSize.height + heightOfDetailLabel  + inset )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDoneButtonOnKeyboard( _ textView: UITextView){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        textView.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        complaintsTextView.resignFirstResponder()
    }
    
}


extension CardSelectableTableViewCell: UITextViewDelegate {
    
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if let limit = viewModel?.getLimitOfText() {
            limitLabel.text = "\(limit - textView.text.count)"
        }
        if  underTextViewLabel.textColor ==  #colorLiteral(red: 0.3422456086, green: 0.3402163684, blue: 0.3438087702, alpha: 1) {
            underTextViewLabel.text = nil
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        limitLabel.text = nil

        return true
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        delegate?.textViewShouldBeginEditing(firstResponderView: textView)
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
