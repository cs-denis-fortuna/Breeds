//
//  AppDelegate.swift
//  Breeds
//
//  Created by nicholas.babo on 02/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let initialCoordinator: BreedsCoordinator = BreedsCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow()
        window.rootViewController = initialCoordinator.start(with: .root)
        window.makeKeyAndVisible()

        self.window = window

        return true
    }
}
