//
//  SelectableFieldCell.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 03.03.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

class SectableFieldCell: UICollectionViewCell  {
    
    var viewModel: SelectableFieldCellViewModelType? {
        didSet {
            guard let vm = viewModel else {return}
            label.text = vm.title
            contentView.backgroundColor = vm.isActive ? #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) : #colorLiteral(red: 0.2589560151, green: 0.2601605952, blue: 0.2630832195, alpha: 1)
        }
    }
    
     let  label: UILabel = {
        let lbel = UILabel()
        lbel.font = UIFont(name: "Verdana", size: 18)
        lbel.textAlignment = .center
        lbel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return lbel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
//        backgroundColor = .clear
        contentView.layer.cornerRadius = 15.0
        label.frame = contentView.frame
//        label.center = contentView.center
//        label.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
//        label.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
//        label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
