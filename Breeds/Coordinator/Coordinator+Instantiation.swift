//
//  Coordinator+Instantiation.swift
//  Breeds
//
//  Created by denis.fortuna on 09/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

import UIKit

extension Coordinator {

    func createInitialViewController(from storyboard: String) -> UIViewController? {
        return UIStoryboard(name: storyboard, bundle: .main).instantiateInitialViewController()
    }

    func createViewController(named identifer: String, from storyboard: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: .main)

        return storyboard.instantiateViewController(identifier: identifer)
    }
}
