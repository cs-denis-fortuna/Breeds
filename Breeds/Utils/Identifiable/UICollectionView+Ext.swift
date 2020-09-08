//
//  UICollectionView+Ext.swift
//  Breeds
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath,
                                                             cellType: T.Type = T.self) -> T {
        let dequeueCell = self.dequeueReusableCell(withReuseIdentifier: cellType.uniqueIdentifier,
                                                   for: indexPath)
        guard let cell = dequeueCell as? T else {
            preconditionFailure("Could not dequeue cell with identifier: \(cellType.uniqueIdentifier)")
        }
        return cell
    }
}
