//
//  SceneDelegate.swift
//  Breeds
//
//  Created by nicholas.babo on 02/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let initialCoordinator: BreedsCoordinator = BreedsCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = initialCoordinator.start(with: .root)
        window?.backgroundColor = BackgroundColor.main
        window?.makeKeyAndVisible()
    }
}
