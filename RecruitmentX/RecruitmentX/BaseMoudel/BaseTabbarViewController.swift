//
//  BaseTabbarViewController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/14.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

class BaseTabbarViewController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
        setStyleConfig()
        addChildController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}


extension BaseTabbarViewController {
    //样式设置
    private func setStyleConfig() {
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor.RGBA(r: 55, g: 194, b: 188, a: 1)
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.shadowImage = nil
    }
    //增加子视图
    private func addChildController() {
        let homeVC = RXHomeViewController()
        let rxHomeNav = BaseNavigationController(rootViewController: homeVC)
        rxHomeNav.tabBarItem.title = "首页"
        
        let individualVC = RXIndividualViewController()
        let rxIndividualNav = BaseNavigationController(rootViewController: individualVC)
        rxIndividualNav.tabBarItem.title = "我的"
        
        addChild(rxHomeNav)
        addChild(rxIndividualNav)
    }
    
    
}


extension BaseTabbarViewController {
    // tabbar隐藏动画 ，需要完善
    func animateHiddenTabbar(_ isHidden: Bool) {
        UIView.animate(withDuration: 0.1) {
            if isHidden {
                var frame = self.tabBar.frame
                frame.origin.y = UIScreen.main.bounds.size.height
                self.tabBar.frame = frame
            
            } else {
                var frame = self.tabBar.frame
                
                frame.origin.y = UIScreen.main.bounds.size.height - (49.0 + 34.0)
                self.tabBar.frame = frame
                
            }
        }
    }
    
    
    
    
}
