//
//  ssTableView.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 13.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

class CardTableAttributeTableViewCell: UITableViewCell {
    
//    var subViews = [CardTableAttributeRow]()
    let optimalWidth = UIScreen.main.bounds.width < 400 ? UIScreen.main.bounds.width  : 400

    weak var delegate: Output?
    var delegate1: UpdateTable!
    var indexPathRow: Int!
    
    private let attributeLabelHeight: CGFloat = 30.0
    private let topMargin: CGFloat = 5.0
    private let undelineHeight: CGFloat = 0.5

    
    var viewModel: CardTableCellViewModelType? {
        didSet {
            guard let vm = viewModel else { return }
            self.attributeLabel.text = vm.getTitle()
            setupTable()
        }
    }
    
    let attributeLabel : UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.8073702455, green: 0.8025718331, blue: 0.8110593557, alpha: 1)
        
        label.font = UIFont(name: "Verdana", size: 18)
        return label
    }()
    
    var detailLabel : UILabel?
    
     var complaintsTextView : UITextView?
    
     var underTextViewLabel:UILabel?
    
    
    //MARK:- ContentView
    
    let customContentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMinYCorner]
        view.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        return view
    }()
    
    lazy  var tableContentView: ContentTableView = {
        let view = ContentTableView()
        view.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        return view
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
    
    var button: UIButton?
    
    private func setupTable() {
        self.tableContentView.table.viewModel = viewModel!.tableViewModel

        
        if viewModel!.tableType == .dynamicTable {
            button = UIButton()
            contentView.addSubview(button!)
            button!.frame.size.width = 60
            button!.frame.size.height = 60
            button!.layer.cornerRadius = 30
            button!.setTitle("+", for: .normal)
            button!.titleLabel?.textAlignment = .center
            button!.titleLabel?.font = UIFont(name: "Verdana", size: 35)
            button!.addTarget(self, action: #selector(addNewRow), for: .touchDown)
            button!.backgroundColor = .blue
        }
       
        if viewModel!.hasAdditionalText {

            detailLabel = UILabel()
            detailLabel!.textColor = #colorLiteral(red: 0.7801750302, green: 0.7755385041, blue: 0.7837398648, alpha: 1)
            detailLabel!.text = "Детально: "
            
            complaintsTextView = UITextView()
            complaintsTextView!.textContainerInset =  .zero
            complaintsTextView!.textContainer.lineFragmentPadding = 0
            complaintsTextView!.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            complaintsTextView!.delegate = self
            complaintsTextView!.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
            complaintsTextView!.font = UIFont(name: "Verdana", size: 16)
            
            underTextViewLabel  = UILabel()
            underTextViewLabel!.textColor = #colorLiteral(red: 0.3422456086, green: 0.3402163684, blue: 0.3438087702, alpha: 1)
            underTextViewLabel!.text = "Введите данные"
            underTextViewLabel!.font = UIFont(name: "Verdana", size: 16)
            underTextViewLabel!.numberOfLines = 0

            contentView.addSubview(detailLabel!)
            contentView.addSubview(complaintsTextView!)
            contentView.addSubview(underTextViewLabel!)
            
            addDoneButtonOnKeyboard(textView: complaintsTextView!)
        }
    }
    
    var temprow: UIView!
    @objc func addNewRow() {
        tableContentView.table.insertRow()
        delegate1.update()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
        self.selectionStyle = .none
        let width = UIScreen.main.bounds.width
        self.contentView.addSubview(attributeLabel)
        self.contentView.addSubview(undeline)
        self.contentView.addSubview(headerView)
        self.contentView.addSubview(tableContentView)

        headerView.frame = CGRect(x: 0, y: 0, width: width, height: 5)
        attributeLabel.frame = CGRect(x: 7, y: headerView.frame.maxY, width: width, height: attributeLabel.font.lineHeight + 10)
        undeline.frame = CGRect(x: 7, y: attributeLabel.frame.maxY, width: width, height: 0.5)
        tableContentView.frame = CGRect(x: 0, y: undeline.frame.maxY, width: optimalWidth, height: 1)

        selectionStyle = .none
            
    }
 
    func addDoneButtonOnKeyboard(textView: UITextView){
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
        complaintsTextView?.resignFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        tableContentView.frame = CGRect(x: 0, y: undeline.frame.maxY + 10, width: optimalWidth, height: tableContentView.table.contentSize.height)
        button?.frame.origin.y = tableContentView.frame.maxY + 20
        button?.center.x = contentView.center.x
        
        detailLabel?.frame = CGRect(x: 10, y: tableContentView.frame.maxY + 30, width: detailLabel!.text!.getWidth(font: detailLabel!.font), height: detailLabel!.font.lineHeight)
        complaintsTextView?.frame = CGRect(x: detailLabel?.frame.maxX ?? 0.0 + 10.0, y: tableContentView.frame.maxY + 30, width: contentView.frame.width - (detailLabel?.frame.maxX ?? 0.0 + 10.0), height: detailLabel!.font.lineHeight)
        underTextViewLabel?.frame = complaintsTextView?.frame ?? .zero
        tableContentView.configure()
 
        print(viewModel!.getTitle())
        print(" \(undelineHeight) +  \(attributeLabel.frame.height)   + \(headerView.frame.height) + 10 + \(tableContentView.table.contentSize.height) +  \((viewModel!.hasAdditionalText ? 30.0 + 10 : 0.0)) + \((viewModel!.tableType == .dynamicTable ? 50.0 + 10 : 0.0)) + \(10)")
        return  CGSize(width: contentView.frame.width, height: undelineHeight +  attributeLabel.frame.height   + headerView.frame.height + 10 + tableContentView.table.contentSize.height +  (viewModel!.hasAdditionalText ? detailLabel!.frame.height + 30 : 0.0) + (viewModel!.tableType == .dynamicTable ? 60.0 + 20 + 10 : 0.0) + 10)
    }
    

    
    
}




extension CardTableAttributeTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        delegate?.didChangeText(str: textView.text, indexPathRow: indexPathRow)
        //        viewModel?.sendData(data: &textView.text)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if underTextViewLabel?.textColor ==  #colorLiteral(red: 0.3422456086, green: 0.3402163684, blue: 0.3438087702, alpha: 1) {
            underTextViewLabel?.text = nil
        }
    }
    
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        delegate?.textViewShouldBeginEditing(firstResponderView: textView)
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            underTextViewLabel?.text = "Введите данные"
            underTextViewLabel?.textColor = #colorLiteral(red: 0.3422456086, green: 0.3402163684, blue: 0.3438087702, alpha: 1)
        }
    }
}




