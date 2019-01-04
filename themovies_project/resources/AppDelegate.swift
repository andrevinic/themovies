//
//  AppDelegate.swift
//  themovies_project
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        guard let upcomingViewController = R.storyboard.upcoming.navigationUpComingViewController() else{
            fatalError("Couldn't init upcoming view controller")
        }
        self.window?.rootViewController = upcomingViewController
        return true
    }
}

