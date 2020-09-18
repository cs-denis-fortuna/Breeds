//
//  BreesCollectionDataSource.swift
//  Breeds
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import UIKit

struct ImageViewModel {
    var url: String
    var title: String

    init(url: String, title: String) {
        self.url = url
        self.title = title
    }

    init(image: Image) {
        self.url = image.url
        self.title = image.breeds.first?.name ?? "Breed not identified"
    }
}

final class BreedsCollectionDataSource: NSObject, UICollectionViewDataSource {

    private let viewModels: [ImageViewModel]

    var didSelectImage: ((IndexPath) -> Void)?

    init(images: [ImageViewModel]) {
        self.viewModels = images
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: BreedCollectionViewCell.self)

        let model = viewModels[indexPath.row]

        cell.set(imageURL: model.url, name: model.title)

        return cell
    }
}

extension BreedsCollectionDataSource: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectImage?(indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width / 2
        return CGSize(width: size, height: size)
    }
}
