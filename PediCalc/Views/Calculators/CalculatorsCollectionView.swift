//
//  CalculatorsCollectionView.swift
//  PediCalc
//
//  Created by Leonardo Gomes Fernandes on 05/02/21.
//

import Foundation
import UIKit

class CalculatorsCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
