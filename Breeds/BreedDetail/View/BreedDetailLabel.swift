//
//  BreedDetailLabel.swift
//  Breeds
//
//  Created by denis.fortuna on 08/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

import UIKit

class BreedDetailLabel: UILabel {

    // MARK: Init
    init() {
        super.init(frame: .zero)
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    func setup(title: String, description: String?) {
        guard let description = description, !description.isEmpty else {
            removeFromSuperview()
            return
        }
        
        let attributedText = NSMutableAttributedString()
        attributedText.bold(title)
        attributedText.regular(description)
        self.attributedText = attributedText
    }
}
