//
//  TableAttributeRowContentHeader.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 28.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

class TableAttributeRowHeader: UITableViewCell {
        
    var viewModel: TableAttributeRowHeaderViewModelType? {
        didSet {
            makeRow()
        }
    }
    

    weak var delegate1: UpdateTable!
    weak var delegate: Output?
    
    private func makeRow()  {
        var textFieldWidth: CGFloat!
        let optimalWidth =  UIScreen.main.bounds.width < 400 ?  UIScreen.main.bounds.width : 500
        if viewModel!.hasRowsTitles {
            textFieldWidth = (optimalWidth - 150)/CGFloat(viewModel!.numberOfColumn)
        } else {
            textFieldWidth = optimalWidth/CGFloat(viewModel!.numberOfColumn)
        }

        let numberOfColumn = viewModel?.numberOfColumn ?? 0
        
        var lastX: CGFloat = 0

        if viewModel!.hasRowsTitles {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: contentView.frame.height))
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
            label.backgroundColor = #colorLiteral(red: 0.09603568166, green: 0.1090455726, blue: 0.1595930159, alpha: 1)
            contentView.addSubview(label)
            
            lastX = label.frame.maxX

        }
        

        for columnIndex in 0..<numberOfColumn {
            let label = UILabel()
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textColor = #colorLiteral(red: 0.4667062759, green: 0.6879578233, blue: 0.6657694578, alpha: 1)
            label.backgroundColor = #colorLiteral(red: 0.09603568166, green: 0.1090455726, blue: 0.1595930159, alpha: 1)

            contentView.addSubview(label)
            label.text = viewModel!.columnTitle(index: columnIndex)
            label.frame = CGRect(x: lastX, y: 0, width: textFieldWidth, height: contentView.frame.height)
            
            if viewModel!.hasRowsTitles || (columnIndex != 0  && !viewModel!.hasRowsTitles) {
                let separateBorder = verticalLine
                label.addSubview(separateBorder)
                separateBorder.frame.size.height = contentView.frame.height
                separateBorder.frame.origin.x = 0
            }
            lastX = label.frame.maxX

        }

    }
    
    

    
}
