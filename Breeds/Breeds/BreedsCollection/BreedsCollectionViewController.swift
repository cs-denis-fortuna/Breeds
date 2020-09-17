//
//  BreedsCollectionViewController.swift
//  Breeds
//
//  Created by nicholas.babo on 09/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import UIKit

protocol BreedsCollectionViewControllerDelegate: AnyObject {
    func didSelectImage(_ selectedImage: Image)
}

final class BreedsCollectionViewController: UIViewController {
    
    // MARK: Views
    @IBOutlet weak var collectionView: UICollectionView!

    private var dataSource: BreedsCollectionDataSource? {
        didSet {
            guard let dataSource = dataSource else { return }

            dataSource.didSelectImage = { [weak self] indexPath in
                guard let image = self?.images[indexPath.item] else { return }
                self?.showDetailForSelectedBreed(image)
            }

            collectionView.dataSource = dataSource
            collectionView.delegate = dataSource
            collectionView.reloadData()
        }
    }

    // MARK: Navigation
    weak var coordinator: BreedsCollectionViewControllerDelegate?

    // MARK: Network
    private let networkManager: NetworkManagerProtocol

    // MARK: Images
    private var images: [Image] = [] {
        didSet {
            let viewModels = images.map { ImageViewModel(image: $0) }
            setImages(viewModels)
        }
    }

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.networkManager = NetworkManager()
        super.init(coder: coder)
    }

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

        networkManager.request(service: service, responseType: [Image].self) { [weak self] result in
            switch result {
            case .success(let images):
                self?.images = images
            case .failure:
                print("falhou :(")
            }
        }
    }

    func setImages(_ images: [ImageViewModel]) {
        self.dataSource = BreedsCollectionDataSource(images: images)
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
