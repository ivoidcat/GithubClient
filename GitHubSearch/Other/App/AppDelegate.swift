//
//  AppDelegate.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 27/12/2018.
//  Copyright © 2018 Eugene Karambirov. All rights reserved.
//

import UIKit
import AlamofireNetworkActivityIndicator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.setupNavigationBarAppearance()
        self.setupStatusBarAppearance()
        self.setupBarButtonItemAppearance()
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        let searchVC = SearchViewController()
//        window?.rootViewController = UINavigationController(rootViewController: searchVC)
        window?.rootViewController = TabBarController(items: [.search, .favorites])
        window?.makeKeyAndVisible()

        NetworkActivityIndicatorManager.shared.isEnabled = true

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}


extension AppDelegate {
    
    private func setupStatusBarAppearance() {
        UIApplication.shared.statusBarView?.backgroundColor = Configuration.Theme.main
    }
    
    private func setupNavigationBarAppearance() {
        
        UINavigationBar.appearance().tintColor = Configuration.Theme.navigationTitleColor
        UINavigationBar.appearance().barTintColor = Configuration.Theme.main
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Configuration.Theme.navigationTitleColor,
             NSAttributedString.Key.font: Configuration.Font.normal]
        
        if #available(iOS 11.0, *) {
            //            UINavigationBar.appearance().prefersLargeTitles = true
            UINavigationBar.appearance().largeTitleTextAttributes =
                [NSAttributedString.Key.foregroundColor: Configuration.Theme.navigationTitleColor]
        }
    }
    
    private func setupBarButtonItemAppearance() {
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: Configuration.Theme.main,
             NSAttributedString.Key.font: Configuration.Font.normal],
            for: .normal)
    }
    
    
}
