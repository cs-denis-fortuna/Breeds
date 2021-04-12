//
//  CoordinatorProtocol.swift
//  Breeds
//
//  Created by denis.fortuna on 09/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
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
