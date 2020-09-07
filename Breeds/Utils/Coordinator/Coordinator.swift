//
//  Coordinator.swift
//  Breeds
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import UIKit

enum NavigationType {
    case root
    case push
    case present(_ completion: (() -> Void)? = nil)
}

protocol Coordinator: AnyObject {
    var currentViewController: UIViewController? { get set }
    var navigationController: UINavigationController { get set }
    func start(with navigationType: NavigationType) -> UIViewController
}
