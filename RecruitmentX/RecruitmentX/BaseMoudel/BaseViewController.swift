//
//  BaseViewController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/14.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController ,UINavigationControllerDelegate{
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        let tabbarVC = tabBarController as! BaseTabbarViewController
//        if (navigationController?.viewControllers.count)! <= 1 {
//            tabbarVC.animateHiddenTabbar(false)
//        }
//    }
    
    
    

}


//提供基础视图自定义控制方法
extension BaseViewController {
    @objc func customPopAction() {
        self.navigationController?.popViewController(animated: true)
    }
}
