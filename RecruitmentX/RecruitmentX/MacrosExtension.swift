//
//  FuncExtension.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/14.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit
/*
 Swift中不存在宏定义常量或者方法
 使用自定义类实现类似定义便捷常量或者扩展方法
 
 部分方法扩展采用扩展该类的类方法方式，统一写于此处
 */

// MARK: -  系统尺寸相关
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenBounds = UIScreen.main.bounds

/**
 ## 状态栏高度
 ## 刘海屏时高度为：44，非刘海屏高度为20
 */
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let kNavBarHright :CGFloat = 44.0

let kTopNavBarHeight = kStatusBarHeight + kNavBarHright
/**
 ## 此处使用刘海屏的状态栏高度不同判断
 ## 刘海屏时tabbar高度为83（增加了安全区域高度），非时为49（tabbar容器真实高度）
 */
let kTabbarHeight = kStatusBarHeight > 20 ? 83.0 : 49.0

/**
 ## 底部安全区域高度，刘海屏时为34
 */
let kBottomSafeAreaHeight :CGFloat = kStatusBarHeight > 20 ? 34 : 0


//用于部分适配，采用屏幕比例 以iPhone6尺寸（375*667）为标准
//数据类型为CGFloat
let kIPhone6WidthScale : CGFloat = kScreenWidth / 375.0
let kIPhone6HeightScale : CGFloat = kScreenHeight / 667.0

/**
 根据iPhone6宽度计算拉伸后数值
 此处可根据需求修改拉伸参数  待添加
 */
func kScaleValue(originValue : CGFloat) -> CGFloat {
    return originValue * kIPhone6WidthScale
}













// MARK: -  扩展方法（类，对象）
// MARK: - 颜色扩展
extension UIColor {
    class func RGB(r : CGFloat, g : CGFloat, b : CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    class func RGBA(r : CGFloat, g : CGFloat, b : CGFloat, a : CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    class func HexA(hexValue : Int, a : CGFloat) -> UIColor {
        return UIColor(red: CGFloat(((hexValue & 0xFF0000) >> 16)) / 255.0,
                       green: CGFloat(((hexValue & 0xFF00) >> 8)) / 255.0,
                       blue: CGFloat((hexValue & 0xFF)) / 255.0, alpha: a)
    }
    
    class func Hex(hexValue : Int) -> UIColor {
        return HexA(hexValue: hexValue, a: 1)
    }
    //随机颜色
    class func randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random()%256) / 255.0,
                       green: CGFloat(arc4random()%256) / 255.0,
                       blue: CGFloat(arc4random()%256) / 255.0,
                       alpha: 1)
    }
}

enum XPButtonLayoutStyle {
    case top //基于image位置的枚举
    case left
    case bottom
    case right
}
// MARK: -  button扩展枚举调节图片文字位置
extension UIButton {
    /**
     ## 使用该方法button必须设置title和image
     ## 不宜使用snpkit或者masonry等约束布局方式，因为添加gap后，button的原尺寸无法修改
     ## 如果使用约束布局，需要在约束执行后调用本方法
     */
    func xpLayoutButtonEdgeInsetStyle(style : XPButtonLayoutStyle , imageTitleGap : CGFloat) {
        /**
        *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
        *  如果只有title，那它上下左右都是相对于button的，image也是一样；
        *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
        */
        let imageW : CGFloat? = self.imageView?.frame.size.width
        let imageH : CGFloat? = self.imageView?.frame.size.height
        
        var labelW : CGFloat? = 0.0
        var labelH : CGFloat? = 0.0
        
        if  ((UIDevice.current.systemVersion) as NSString).floatValue >= 8 {
            labelW = self.titleLabel?.intrinsicContentSize.width
            labelH = self.titleLabel?.intrinsicContentSize.height
        } else {
            labelW = self.titleLabel?.frame.width
            labelH = self.titleLabel?.frame.height
        }
        
        var imageEdInsets = UIEdgeInsets.zero
        var labelEdInsets = UIEdgeInsets.zero
        
        switch style {
        case .top:
            imageEdInsets = UIEdgeInsets(top: -labelH! - imageTitleGap / 2, left: 0, bottom: 0, right: -labelW!)
            labelEdInsets = UIEdgeInsets(top: 0, left: -imageW!, bottom: -imageH! - imageTitleGap / 2.0, right: 0)
        case .left:
            imageEdInsets = UIEdgeInsets(top: 0, left: -imageTitleGap / 2, bottom: 0, right: imageTitleGap / 2)
            labelEdInsets = UIEdgeInsets(top: 0, left: imageTitleGap / 2, bottom: 0, right: -imageTitleGap / 2)
        case .bottom:
            imageEdInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelH! - imageTitleGap / 2.0, right: -labelW!)
            labelEdInsets = UIEdgeInsets(top: -imageH! - imageTitleGap / 2.0, left: -imageW!, bottom: 0, right: 0)
        case .right:
            imageEdInsets = UIEdgeInsets(top: 0, left: labelW! + imageTitleGap / 2.0, bottom: 0, right: -labelW! - imageTitleGap / 2.0)
            labelEdInsets = UIEdgeInsets(top: 0, left: -imageW! - imageTitleGap / 2.0, bottom: 0, right: imageH! + imageTitleGap / 2.0)
        }
        
        self.titleEdgeInsets = labelEdInsets
        self.imageEdgeInsets = imageEdInsets
        
        //无法重置button的约束宽度
//        self.frame.size.width = labelW! + imageW! + imageTitleGap
        
    }
    
}


// MARK: -  其他扩展

//计算字符串尺寸
//func CaluteStringSize(str : String, limitSize : CGSize, font : UIFont) -> CGSize {
//    let size = str
//    
//    
//}

//根据颜色绘制出Image
func ImageWithColor(color : UIColor, size : CGSize) -> UIImage? {
    
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContext(size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image

}
func ImageWithColor(color : UIColor) -> UIImage? {
    
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image

}
