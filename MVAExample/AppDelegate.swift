//
//  AppDelegate.swift
//  MVAExample
//
//  Created by moath on 4/22/18.
//  Copyright © 2018 moath othman. All rights reserved.
//

import UIKit

@UIApplicationMain
public
class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?


    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: CarsListingWireFrame().viewController)
        self.window?.makeKeyAndVisible()
        return true
    }
}

