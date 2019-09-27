//  AppDelegate.swift
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//
import Instabug

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appToken = "81fb5c82a5d7144eb77da6e1ec9d60e6"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Instabug.start(withToken: appToken, invocationEvents: .floatingButton)
        return true
    }
}
