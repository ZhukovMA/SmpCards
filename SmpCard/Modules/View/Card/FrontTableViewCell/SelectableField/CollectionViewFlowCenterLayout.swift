//
//  Layput.swift
//  SmpCard
//
//  Created by Maxim Zhukov on 28.02.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

class CollectionViewFlowCenterLayout: UICollectionViewFlowLayout {

    private var rowsOfElements = [[UICollectionViewLayoutAttributes]]()
    private var space: CGFloat
    
 

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }

        var currentRowY: CGFloat = -1

        for attribute in attributes {
            if currentRowY != attribute.frame.midY {
                currentRowY = attribute.frame.midY
                rowsOfElements.append([UICollectionViewLayoutAttributes]())
            }
            rowsOfElements[rowsOfElements.count - 1].append(attribute)
        }

        for index in 0..<rowsOfElements.count {
            let padding = ((collectionView?.frame.width ?? 0) - getRowWidth(forRowIndex: index)) / 2
            var offset = padding
            for attribute in rowsOfElements[index] {
                attribute.frame.origin.x = offset
                offset += attribute.frame.width + space
            }
        }

        return rowsOfElements.flatMap { $0 }
    }



    private func getRowWidth(forRowIndex index: Int) -> CGFloat {
        return rowsOfElements[index].reduce(0, { result, attribute -> CGFloat in
            return result + attribute.frame.width
        }) + CGFloat(rowsOfElements[index].count - 1) * space
    }


    init(withSpace space: CGFloat) {
        self.space = space
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


