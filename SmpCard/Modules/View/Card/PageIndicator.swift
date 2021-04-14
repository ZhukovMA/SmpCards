//
//  PageIndicator.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 23.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

// СДЕЛАТЬ: ViewModel для ячейки
class PageIndicatorBarCell: UICollectionViewCell  {
    
    let label: UILabel = {
        let lbel = UILabel()
        lbel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4)
        lbel.textAlignment = .center
        return lbel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.frame = contentView.frame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class PageIndicator: UICollectionView {
    
    let titleOfHeader = ["О вызове","Анамнез","Объективные данные","Нервная система", "Дыхательная система", "Органы кровообращения", "Органы пищеварения", "Мочеполовая система", "Локальный статус", "Расход"]
    
    let fontforItem = UIFont(name: "Verdana", size: 18) ?? UIFont()
    
    
    init(frame: CGRect, inset: CGFloat) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        contentInset = UIEdgeInsets(top: 0, left:  (UIScreen.main.bounds.width - (titleOfHeader[0].getWidth(font: fontforItem) + 20))/2, bottom: 0, right: (UIScreen.main.bounds.width - (titleOfHeader[9].getWidth(font: fontforItem) + 20))/2)
        contentSize = CGSize(width: frame.width, height: frame.height)

        register(PageIndicatorBarCell.self, forCellWithReuseIdentifier: "cell")
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PageIndicator: UICollectionViewDelegate, UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageIndicatorBarCell
        cell.label.text = titleOfHeader[indexPath.row]
        cell.label.font = fontforItem
        cell.label.frame.size = CGSize(width: titleOfHeader[indexPath.row].getWidth(font: fontforItem) + 20, height: 30)
        return cell
    }
    
    
    
    

}

extension PageIndicator: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: titleOfHeader[indexPath.row].getWidth(font: fontforItem) + 20, height: 30)
        
    }
    
}


extension String {
    func getWidth(font: UIFont) -> CGFloat {
        return  self.size(withAttributes: [
            NSAttributedString.Key.font : font
        ]).width
    }
    
    func getHeight(font: UIFont) -> CGFloat {
        return  self.size(withAttributes: [
            NSAttributedString.Key.font : font
        ]).height
    }
}
