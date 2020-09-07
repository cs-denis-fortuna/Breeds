//
//  BreedsCollectionViewController.swift
//  Breeds
//
//  Created by nicholas.babo on 09/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import UIKit

class BreedsCollectionViewController: UIViewController {
    
    // MARK: Views
    @IBOutlet weak var collectionView: UICollectionView!

    private var dataSource: BreedsCollectionDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }

            dataSource.didSelectImage = { [weak self] selectedImage in
                self?.showDetailForSelectedBreed(selectedImage)
            }

            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            collectionView.reloadData()
        }
    }

    // MARK: Navigation
    weak var coordinator: BreedsCoordinator?

    // MARK: Network
    private let networkManager: NetworkManager = NetworkManager()

    // MARK: Images
    private var images: [Image] = []

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        fetchBreeds()
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Request

extension BreedsCollectionViewController {

    func fetchBreeds() {
        let service = ImageService.imageList(limit: 20)

        networkManager.request(service: service, responseType: [Image].self) { result in
            switch result {
            case .success(let images):
                self.dataSource = BreedsCollectionDataSource(images: images)
            case .failure:
                print("falhou :(")
            }
        }
    }
}

// MARK: - Navigation
extension BreedsCollectionViewController {
    func showDetailForSelectedBreed(_ selectedImage: Image) {
        coordinator?.didSelectImage(selectedImage)
    }
    
    private func showEmptyBreedFeedback() {
        let alert = UIAlertController(title: "Missing Breed",
                                      message: "The selected image does not have a related Breed yet 😢",
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
