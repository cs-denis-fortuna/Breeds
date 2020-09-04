//
//  BreedDetailViewController.swift
//  Breeds
//
//  Created by nicholas.babo on 15/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import UIKit

class BreedDetailViewController: UIViewController {

    // MARK: Views
    @IBOutlet weak var baseView: BreedDetailView!
    
    // MARK: Properties
    var breed: Breed?
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = breed?.name
        baseView.setup(breed: breed, imageUrl: imageUrl)
    }
}
