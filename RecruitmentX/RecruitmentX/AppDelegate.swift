//
//  AppDelegate.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/2.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupMainUIWindow()
        
        
        return true
    }
    
    
}


extension AppDelegate {
// MARK: - 设置Window
    private func setupMainUIWindow() {
        let RxTabbarVC = BaseTabbarViewController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = RxTabbarVC
        window?.makeKeyAndVisible()
        
        
        
    }
}
