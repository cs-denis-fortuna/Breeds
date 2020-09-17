//
//  BreedCollectionViewCell.swift
//  Breeds
//
//  Created by nicholas.babo on 09/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import UIKit

class BreedCollectionViewCell: UICollectionViewCell {
    
    // MARK: Views
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    func set(imageURL: URL?, name: String) {
        self.imageView.setImage(url: imageURL)
        self.nameLabel.text = name
    }
}
