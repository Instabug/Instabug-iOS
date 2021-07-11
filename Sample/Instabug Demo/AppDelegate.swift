//  AppDelegate.swift
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//
import Instabug

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appToken = <#Your token here#>
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Instabug.start(withToken: appToken, invocationEvents: .floatingButton)
        return true
    }
}
