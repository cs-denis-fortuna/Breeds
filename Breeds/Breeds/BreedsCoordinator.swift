//
//  BreedsCoordinator.swift
//  Breeds
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
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
        let breedsCollectionViewController = createViewController(BreedsCollectionViewController.self,
                                                                  from: .main)
        breedsCollectionViewController.coordinator = self
        
        show(breedsCollectionViewController, with: .push)
        return navigationController
    }
}

// MARK: BreedsCollectionViewController events

extension BreedsCoordinator {
    func didSelectImage(_ selectedImage: Image) {
        let breedDetailViewController = createViewController(BreedDetailViewController.self,
                                                             from: .main)
        breedDetailViewController.imageUrl = selectedImage.url
        breedDetailViewController.breed = selectedImage.breeds.first

        show(breedDetailViewController, with: .push)
    }
}
