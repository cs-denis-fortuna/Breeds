//
//  BreedsCollectionViewController.swift
//  Breeds
//
//  Created by nicholas.babo on 09/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import UIKit
import Alamofire
import Keys

class BreedsCollectionViewController: UIViewController {
    
    // MARK: Views
    let collectionFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionFlowLayout)
        collection.delegate = self
        collection.dataSource = self
//        collection.prefetchDataSource = self
        collection.backgroundColor = BackgroundColor.main
        collection.register(BreedCollectionViewCell.self, forCellWithReuseIdentifier: Identifier.Cell.breedCell)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    private var images: [Image] = []

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigation()
        fetchBreeds()
    }
    
    func setupNavigation() {
        title = "Breeds"
        navigationController?.applyCustomAppearence()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Request

extension BreedsCollectionViewController {

    func fetchBreeds() {
        guard let url = URL(string: "https://api.thedogapi.com/v1/images/search") else { return }
        let authHeader = ["x-api-key": BreedsKeys().theDogAPIKey]
        let parameters: [String: Any] = [
            "order": "Asc",
            "limit": 20,
            "page": 0
        ]

        AF.request(url,
                   method: .get,
                   parameters: parameters,
                   headers: HTTPHeaders(authHeader)).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let object = try JSONDecoder().decode([Image].self, from: data)
                    self.images = object
                    self.collectionView.reloadData()
                } catch {
                    print("falhou :(")
                }
            case .failure:
                print("falhou :(")
            }
        }
    }
}

// MARK: - Navigation
extension BreedsCollectionViewController {
    func showDetailForSelectedBreed(_ selectedImage: Image) {
        guard let selectedBreed = selectedImage.breeds.first else { return }
        let breedDetailController = BreedDetailViewController(breed: selectedBreed, imageUrl: selectedImage.url)
        show(breedDetailController, sender: self)
    }
    
    private func showEmptyBreedFeedback() {
        let alert = UIAlertController(title: "Missing Breed",
                                      message: "The selected image does not have a releted Breed yet 😢",
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
        cell.setup(image: model)

        return cell
    }
}

// MARK: Autolayout
extension BreedsCollectionViewController: ViewCodable {
    func setupViewHierarchy() {
        view.addSubview(collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
