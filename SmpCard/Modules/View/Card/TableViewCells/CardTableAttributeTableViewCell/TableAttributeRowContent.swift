//
//  TableAttributeRow.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 28.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

class TableTextField: UITextField {
    var positionRow: Int!
}


class TableAttributeRowContent: UITableViewCell {
    
    var superView: TableAttributeView!
    
    var viewModel: TableAttributeRowContentViewModelType? {
        didSet {
            makeRow()
        }
    }
    
    var keyboardDelegate: KeyboardDelegate!
    
    private func makeRow()  {
        var textFieldWidth: CGFloat!
        let optimalWidth =  UIScreen.main.bounds.width < 400 ?  UIScreen.main.bounds.width : 500
        if viewModel!.hasRowsTitles {
            textFieldWidth = (optimalWidth - 150)/CGFloat(viewModel!.numberOfColumn)
        } else {
            textFieldWidth = optimalWidth/CGFloat(viewModel!.numberOfColumn)
        }

        let numberOfColumn = viewModel?.numberOfColumn ?? 0
        let rowTitle =  viewModel?.rowTitle
        
        var lastX: CGFloat = 0

        if viewModel!.hasRowsTitles {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: contentView.frame.height))
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
            label.text = rowTitle
            label.backgroundColor = #colorLiteral(red: 0.09603568166, green: 0.1090455726, blue: 0.1595930159, alpha: 1)
            contentView.addSubview(label)

            lastX = label.frame.maxX
        }
        

        for columnIndex in 0..<numberOfColumn {
            let textField = TableTextField()
            textField.text =  viewModel!.getData(column: columnIndex)
            textField.positionRow = viewModel!.numberOfRow
            textField.keyboardType = .numbersAndPunctuation
            textField.delegate = superView
            textField.font = UIFont(name: "AppleSDGothicNeo-Regular", size: textFieldWidth > 70 ? 18: 15)
            textField.textAlignment = .center
            addDoneButtonOnKeyboard(textField: textField)
            contentView.addSubview(textField)
            textField.frame = CGRect(x: lastX, y: 0, width: textFieldWidth, height: contentView.frame.height)
            if viewModel!.hasRowsTitles || (columnIndex != 0  && !viewModel!.hasRowsTitles) {
                let separateBorder = verticalLine
                textField.addSubview(separateBorder)
                separateBorder.frame.size.height = contentView.frame.height
                separateBorder.frame.origin.x = 0
            }
            lastX = textField.frame.maxX

        }

    }
    
    func addDoneButtonOnKeyboard(textField: UITextField){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        textField.inputAccessoryView = doneToolbar
    }
    @objc func doneButtonAction(){
        keyboardDelegate.keyboardDone()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
//        backgroundColor = .clear

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension TableAttributeRowContent {
    func makeNextTextFieldFirstResponder(_ startIndex: Int?) -> Bool {
        for index in (startIndex ?? 0)..<contentView.subviews.count {
            if let textField = contentView.subviews[index] as? UITextField  {
                textField.becomeFirstResponder()
                textField.selectAll(nil)
                return true
            }
        }
        return false
    }
}
