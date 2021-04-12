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
    let imageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let overlayView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = BackgroundColor.overlay
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let  nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = TextColor.primary
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: Life Cycle
    override init(frame: CGRect = .zero) {
        super.init(frame: frame )
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    func setup(image: Image) {
        nameLabel.text = image.breeds.first?.name ?? "Breed not identified"
        imageView.setImage(url: URL(string: image.url))
    }
    
}

// MARK: Autolayout
extension BreedCollectionViewCell: ViewCodable {
    func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(overlayView)
        overlayView.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            overlayView.heightAnchor.constraint(equalToConstant: 24),
            overlayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: overlayView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: overlayView.trailingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor)
        ])
    }
}
