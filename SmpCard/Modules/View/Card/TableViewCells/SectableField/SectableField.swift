//
//  SectableField.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 28.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit



class SectableField: UICollectionView {
    var viewModel: SelectableFieldViewModelType? 
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout =  CollectionViewFlowCenterLayout(withSpace: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        super.init(frame: frame, collectionViewLayout: layout)
       isScrollEnabled = false
       register(SectableFieldCell.self, forCellWithReuseIdentifier: "cell")
        delegate = self
        dataSource = self

    }


    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension SectableField: UICollectionViewDelegate, UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItemInSection ?? 0
    }

    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SectableFieldCell
        cell.viewModel = viewModel?.cellViewModel(forIndexPath: indexPath)
        return cell
    }
    
    

}

extension SectableField: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = self.viewModel?.cellViewModel(forIndexPath: indexPath)?.title ?? ""
        let cellWidth = text.size(withAttributes:[.font: UIFont(name: "Verdana", size: 18)!]).width + 20.0
        return CGSize(width: cellWidth, height: 42.0)

    }

    
}
