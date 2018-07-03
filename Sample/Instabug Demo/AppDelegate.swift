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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Add your app token below. You can find the token at https://instabug.com/app/sdk/
        Instabug.start(withToken: appToken, invocationEvent: .floatingButton)
        Instabug.setAutoScreenRecordingEnabled(true)
        Instabug.setNetworkLoggingEnabled(true)
        return true
    }
    
}
