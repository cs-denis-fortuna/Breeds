//
//  BreedsCoordinator.swift
//  Breeds
//
//  Created by denis.fortuna on 11/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

import UIKit

final class BreedsCoordinator: Coordinator {
    var currentViewController: UIViewController?
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        navigationController.applyCustomAppearence()
    }
    
    func start(with navigationType: NavigationType) -> UIViewController {
        let breedsCollectionViewController = BreedsCollectionViewController()
        breedsCollectionViewController.coordinator = self
        show(breedsCollectionViewController, with: .push)
        return navigationController
    }
}

// MARK: BreedsCollectionViewController events

extension BreedsCoordinator {
    func didSelectImage(_ selectedImage: Image) {
        guard let breed = selectedImage.breeds.first else { return }
        let imagesUrl = selectedImage.url
        let breedDetailViewController = BreedDetailViewController(breed: breed, imageUrl: imagesUrl)
        show(breedDetailViewController, with: .push)
    }
}
