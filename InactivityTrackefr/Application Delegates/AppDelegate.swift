//
//  AppDelegate.swift
//  InactivityTrackefr
//
//  Created by waheedCodes on 22/08/2023.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(AppDelegate.applicationDidTimeout(notification:)),
                name: .appTimeout,
                object: nil)
        
        return true
    }
    
    @objc func applicationDidTimeout(notification: NSNotification) {
        print("Application did time out, perform action.")
    }
}
