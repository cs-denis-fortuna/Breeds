//
//  Coordinator+Instantiation.swift
//  Breeds
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import UIKit

extension Coordinator {

    func createInitialViewController(from storyboard: Identifier.Storyboard) -> UIViewController? {
        instantiateStoryboard(storyboard).instantiateInitialViewController()
    }

    func createViewController<T: UIViewController>(_ viewController: T.Type, from storyboard: Identifier.Storyboard) -> T {
        let storyboard = instantiateStoryboard(storyboard)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.uniqueIdentifier) as? T else {
            preconditionFailure("Unable to create view controller with identifier \(T.uniqueIdentifier)")
        }

        return viewController
    }

    private func instantiateStoryboard(_ storyboard: Identifier.Storyboard) -> UIStoryboard {
        UIStoryboard(name: storyboard.rawValue, bundle: .main)
    }
}
