//
//  AppDelegate.swift
//  FormFillter
//
//  Created by Xu, Jay on 9/12/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {
        if UnityHelper.sharedInstance().glResourceHandler != nil {
            UnityHelper.sharedInstance().glResourceHandler!.freeOpenGLESResources()
            UnityHelper.sharedInstance().glResourceHandler!.finishOpenGLESCommands()
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

