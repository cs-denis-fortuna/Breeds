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
        navigationController?.applyCustomAppearence()
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
                self.images = images
                self.collectionView.reloadData()
            case .failure:
                print("falhou :(")
            }
        }
    }
}

// MARK: - Navigation
extension BreedsCollectionViewController {
    func showDetailForSelectedBreed(_ selectedImage: Image) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: Self.self))
        
        guard let breedDetailViewController = storyboard.instantiateViewController(identifier: "BreedDetailViewController") as? BreedDetailViewController else { return }
        breedDetailViewController.breed = selectedImage.breeds.first
        breedDetailViewController.imageUrl = selectedImage.url
        
        show(breedDetailViewController, sender: self)
    }
    
    private func showEmptyBreedFeedback() {
        let alert = UIAlertController(title: "Missing Breed",
                                      message: "The selected image does not have a related Breed yet 😢",
                                      preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BreedsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showDetailForSelectedBreed(images[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.width / 2
        return CGSize(width: size, height: size)
    }
}

// MARK: - UICollectionViewDataSource
extension BreedsCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
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
