//
//  AppDelegate.swift
//  ChartExample
//
//  Created by Sahil Reddy on 6/16/21.
//

import UIKit
import SciChart

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let licenseKey = "7e9tYl2x0PjddwSgtC393W+F9v8Hi0a7YuYqmq50nNG0u/FlBJcBAUosc49N/btG7A7x9ALcNk6fpzW98P28tB+RkPy/WF+2cOXp7lHx95eMNp4dvL/R1kbWmoMTtqITGxcR+e2KrBZ06yyU/2EdG0HHU888CqCCfs5CLEjUWJ8k6POjNLl7rstqQNR99InTzGNQ8dPzlRaqT+ZkHR//Q8IfrMcmpMrp/G16O7w3QvUnepbKaQRcUgPVyinwj8Ulwt8oYornUtInidkv7p3gnhDVD+7p0YfIaUBVwfoZW/PKJ9UHCElZEUb5UxlW14eYFlghjbg8eYLx6tskG28efoNGqlhUXEaTZPRpJt4aPlYRS+dfoBjIH3lPCREq9VNA8rSyn7aQOGE/73XBvpqMdxYuo0ElAItBmrdSMpQBw14+GeSjevn94E7qMEeFJ1BcZ14He/8asRVxdt0lDZ8r+z9BP6uAeOWiOOy9rkyrw9ELUb754bXkjsuEe62zOJXD/RG4XIob4T9edfe0g6s/vLN0YnMRhaDM3a1Y7YyeeA4AEgaDYzSF3+2d86A="
        SCIChartSurface.setRuntimeLicenseKey(licenseKey)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
