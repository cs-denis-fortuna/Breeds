//
//  Coordinator+Instantiation.swift
//  Breeds
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
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
