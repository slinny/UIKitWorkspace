//
//  CollectionViewCellServices.swift
//  UIKitTable
//
//  Created by Siran Li on 6/6/24.
//

import UIKit

class CollectionViewCellServices: UICollectionViewCell {
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        var newFrame = layoutAttributes.frame
        newFrame.size = CGSize(width: 128, height: 128)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
    
}
