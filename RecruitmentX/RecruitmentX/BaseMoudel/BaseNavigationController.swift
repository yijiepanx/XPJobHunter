//
//  BaseNavigationController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/14.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

/// <#Description#>
class BaseNavigationController: UINavigationController ,UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //        if viewControllers.count == 1 {
        //            let tabbarVC : BaseTabbarViewController = tabBarController as! BaseTabbarViewController
        //            tabbarVC.animateHiddenTabbar(true)
        //
        //        }
        
        //push时机设置barHidden
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
}

extension BaseNavigationController {
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        if viewControllers.count == 1 {
//            viewController.hidesBottomBarWhenPushed = true
//        } else {
//            viewController.hidesBottomBarWhenPushed = false
//        }
//    }
}
