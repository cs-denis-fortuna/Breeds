//
//  Identifiable.swift
//  Breeds
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import UIKit

protocol Identifiable: AnyObject {
    static var uniqueIdentifier: String { get }
}

extension Identifiable {
    static var uniqueIdentifier: String {
        String(describing: self)
    }
}

extension UIViewController: Identifiable { }
extension UICollectionViewCell: Identifiable { }
