//  AppDelegate.swift
//  Instabug Demo
//
//  Copyright © 2016 Instabug. All rights reserved.
//
import Instabug

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appToken = "6d00bcac51513b9dbafad634f1881be9"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Add your app token below. You can find the token at https://instabug.com/app/sdk/
        Instabug.start(withToken: appToken, invocationEvent: .floatingButton)
        return true
    }
    
}
