//
//  AppDelegate.swift
//  Ceria
//
//  Created by Kevin Gosalim on 10/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var coordinator: MainCoordinator?
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // create the main navigation controller to be used for our app
        let navController = UINavigationController()
        
        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator(navigationController: navController)
        
        // tell the coordinator to take over control
        coordinator?.toLanding()
        
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        extendAudioFileLimit()
        
        return true
    }
    
    func extendAudioFileLimit() {
        var limit:rlimit = rlimit()
        getrlimit(RLIMIT_NOFILE, &limit)
        // change this value to suit your needs
        limit.rlim_cur = 20000
        setrlimit(RLIMIT_NOFILE, &limit)
        getrlimit(RLIMIT_NOFILE, &limit)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

