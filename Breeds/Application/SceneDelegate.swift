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

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard (scene as? UIWindowScene) != nil else { return }
        window?.backgroundColor = BackgroundColor.main
    }
}
