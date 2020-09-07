//
//  BreesCollectionDataSource.swift
//  Breeds
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import UIKit

final class BreedsCollectionDataSource: NSObject, UICollectionViewDataSource {

    private let images: [Image]

    var didSelectImage: ((Image) -> Void)?

    init(images: [Image]) {
        self.images = images
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BreedCell", for: indexPath) as? BreedCollectionViewCell else {
            return UICollectionViewCell()
        }

        let model = images[indexPath.row]

        cell.imageView.setImage(url: URL(string: model.url))
        cell.nameLabel.text = model.breeds.first?.name ?? "Breed not identified"

        return cell
    }
}

extension BreedsCollectionDataSource: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedImage = images[indexPath.row]

        didSelectImage?(selectedImage)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width / 2
        return CGSize(width: size, height: size)
    }
}
