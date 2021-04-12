//
//  Coordinator+Ext.swift
//  Breeds
//
//  Created by denis.fortuna on 09/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

import UIKit

extension Coordinator {

    func show(_ viewController: UIViewController,
              with transition: NavigationType,
              animated: Bool = true) {
        currentViewController = viewController

        switch transition {
        case .push:
            push(viewController, animated: animated)
        case .present(let completion):
            present(viewController, animated: animated, completion: completion)
        case .root:
            root(viewController, animated: animated)
        }
    }

    private func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    private func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }

    private func root(_ viewController: UIViewController, animated: Bool) {
        navigationController.setViewControllers([viewController], animated: animated)
    }
}
