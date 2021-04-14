//
//  CardTableAttributeRow.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 27.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//


import UIKit
protocol UpdateTable: class {
    func update()
}

protocol KeyboardDelegate {
    func keyboardDone()
}

class ContentTableView: UIView {
    
    
    lazy var table: TableAttributeView = {
        let view = TableAttributeView()
        return view
    }()
    
   
    func configure() {
        addSubview(table)
        table.frame = CGRect(x: 0.5, y: 0.5, width: bounds.width-1, height: bounds.height-1)
        layer.borderWidth = 0.5
       layer.borderColor = #colorLiteral(red: 0.2859649062, green: 0.2842708528, blue: 0.287270993, alpha: 1)
       
    }
 
}



class TableAttributeView: UITableView, UpdateTable, KeyboardDelegate {
    
    private var textFieldFirstresponder: UITextField!

    func keyboardDone() {
        textFieldFirstresponder.resignFirstResponder()
    }
    
    func update() {
        UIView.setAnimationsEnabled(false)
       beginUpdates()
       endUpdates()
        UIView.setAnimationsEnabled(true)

    }
    weak var _delegate: Output?

    var viewModel: TableAttributeViewModelType? {
        didSet {
            reloadData()
        }
    }
    
//    
//    override var contentSize: CGSize {
//      didSet {
//        self.invalidateIntrinsicContentSize()
//      }
//    }

    override var intrinsicContentSize: CGSize {
      self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: CGFloat(viewModel!.numberOfRow + 1) * 50.1 )
    }
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
       register(TableAttributeRowContent.self, forCellReuseIdentifier: "cell1")
       register(TableAttributeRowHeader.self, forCellReuseIdentifier: "cell2")
       delegate = self
       dataSource = self
       isScrollEnabled = false
       estimatedRowHeight = 40
       rowHeight = UITableView.automaticDimension
       separatorInset = .zero
       layoutMargins = .zero
        _delegate = DelegateHelper.shared.cardTableView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func insertRow() {
        viewModel?.addRow()
       beginUpdates()
       insertRows(at: [IndexPath(row: viewModel!.numberOfRow, section: 0)], with: .automatic)
       endUpdates()
    }

    
}

extension TableAttributeView: UITableViewDataSource, UITableViewDelegate  {
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.numberOfRow ?? 0) + 1
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = TableAttributeRowHeader()
            cell.viewModel = viewModel?.headerCellViewModel
            return cell
        }
        let cell = TableAttributeRowContent()
        cell.superView = self
        cell.viewModel = viewModel?.contentCellViewModel(row: indexPath.row-1)
        cell.keyboardDelegate = self
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
      }
      
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
      }
}

extension UIView {
    
     var horizontalLine: UIView {
        let bottomBorder = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 3.5))
        bottomBorder.backgroundColor = #colorLiteral(red: 0.2859649062, green: 0.2842708528, blue: 0.287270993, alpha: 1)
        return  bottomBorder
    }
    
     var verticalLine: UIView {
        let separateBorder = UIView(frame: CGRect(x: 0, y: 0, width: 0.5, height: 0))
        separateBorder.backgroundColor = #colorLiteral(red: 0.2859649062, green: 0.2842708528, blue: 0.287270993, alpha: 1)
        return separateBorder
    }
}


extension TableAttributeView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let tfPrev  = textFieldFirstresponder as? TableTextField, let tfPost = textField as? TableTextField,  tfPrev.positionRow == tfPost.positionRow  {
            textField.text = textFieldFirstresponder?.text
        }
        textFieldFirstresponder = textField
       _delegate?.textViewShouldBeginEditing(firstResponderView: textField)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let _textField = textField as? TableTextField,
              let cell = cellForRow(at: IndexPath(row: _textField.positionRow + 1, section: 0)) as? TableAttributeRowContent,
              let indexOrigin =  cell.contentView.subviews.firstIndex(of: textField)
        else { return true}

        if cell.makeNextTextFieldFirstResponder(indexOrigin + 1) {
            return true
        }
        
        if _textField.positionRow == viewModel!.numberOfRow-1 {
            textField.resignFirstResponder()
            return true
        }
        if let nextCell = cellForRow(at: IndexPath(row: _textField.positionRow + 2, section: 0)) as? TableAttributeRowContent {
            if nextCell.makeNextTextFieldFirstResponder(0) {
                return true
            }
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let tf = textField as? TableTextField else {
            return
        }
        viewModel?.sendData(data: text, row: tf.positionRow, column: tf.positionColumn)
    }
}
