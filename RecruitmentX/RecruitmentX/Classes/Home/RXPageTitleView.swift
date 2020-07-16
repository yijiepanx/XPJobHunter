//
//  RXPageTitleView.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/15.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit
import SnapKit

protocol RXPageTitleViewDelegate : AnyObject {
    func pageTitleView(pageTitleView : RXPageTitleView, selectedIndex : Int)
    
}

class RXPageTitleView: UIView {
    // MARK: -  定义属性
    weak var delegate : RXPageTitleViewDelegate?
    
    private var currentIndex : Int = 0
    private var titles : [String]
    private var titlelabels : [UILabel] = [UILabel]()
    
    private lazy var scrollView: UIScrollView = {
        let scrollv = UIScrollView()
//        scrollv.backgroundColor = .red
        scrollv.showsHorizontalScrollIndicator = false
        scrollv.scrollsToTop = false
        scrollv.bounces = false
        return scrollv
    }()
    //用于自动布局计算scrollview contentsize
    private lazy var contentV : UIView = {
        let v = UIView()
//        v.backgroundColor = .purple
        return v
    }()
    //底部滑块
    private lazy var bottomLine : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    
    // MARK: -  自定义构建函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RXPageTitleView {
    private func setupUI() {
        addSubview(scrollView)
        scrollView.frame = CGRect(x: 0, y: 6, width: bounds.size.width, height: 33)
        scrollView.addSubview(contentV)
        contentV.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview().inset(0)
            make.height.equalToSuperview()
        }
        
        setupTitleLabels()
        setupBottomScrollLine()
    }
    
    private func setupTitleLabels() {
        
        var suffixLab : UILabel? = nil
        
        for (index,title) in titles.enumerated() {
            //sublabel init
            let label = UILabel()
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            label.textColor = UIColor(white: 1, alpha: 0.6)
            label.textAlignment = .center
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(labelTapAction)))
            contentV.addSubview(label)
            if index == currentIndex {
                label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
                label.textColor = UIColor(white: 1, alpha: 1)
            }
            
            if suffixLab == nil {
                label.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(20)
                    make.height.equalTo(28)
                }
                suffixLab = label
            } else {
                label.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalTo(suffixLab!.snp.right as ConstraintRelatableTarget).offset(20)
                    make.height.equalTo(28)
                }
                suffixLab = label
            }
            
            titlelabels.append(label)
        }
        guard let _ = suffixLab else { return }
        contentV.snp.makeConstraints { (make) in
            make.right.equalTo(suffixLab!)
        }
    }
    
    private func setupBottomScrollLine() {
        contentV.addSubview(bottomLine)
        guard titlelabels.count > 0 else { return }
        guard let firstLab = titlelabels[currentIndex] as UILabel? else { return }

        bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentV.snp.bottom)
            make.centerX.equalTo(firstLab)
            make.size.equalTo(CGSize(width: 30, height: 3))
        }
        
    }
    
    
 
    
}

// MARK: -  Actions
extension RXPageTitleView {
    
    @objc private func labelTapAction(tapGesture : UITapGestureRecognizer) {
        
        
        guard let tapView = tapGesture.view as? UILabel else { return }
        
        if tapView.tag == currentIndex {
            return
        }
        
        let oldlabel = titlelabels[currentIndex]
        
        UIView.animate(withDuration: 0.5) {
            tapView.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            tapView.textColor = UIColor(white: 1, alpha: 1)
            oldlabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            oldlabel.textColor = UIColor(white: 1, alpha: 0.6)
        }
        
        
        currentIndex = tapView.tag
        
        bottomLine.snp.remakeConstraints { (make) in
            make.bottom.equalTo(contentV.snp.bottom)
            make.centerX.equalTo(tapView)
            make.size.equalTo(CGSize(width: 30, height: 3))
        }
        //动画约束存在问题
//        UIView.animate(withDuration: 0.1) {
//            self.layoutIfNeeded()
//        }
        
        
        //代理执行
        delegate?.pageTitleView(pageTitleView: self, selectedIndex: currentIndex)
    }
    
    
}


// MARK: -  外部调用方法
extension RXPageTitleView {
    func pageTitleViewSelect(currentIndex : Int) {
        if self.currentIndex == currentIndex {
            return
        }
        
        let currentLab = titlelabels[currentIndex]
        let oldlabel = titlelabels[self.currentIndex]
        
        currentLab.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        currentLab.textColor = UIColor(white: 1, alpha: 1)
        oldlabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        oldlabel.textColor = UIColor(white: 1, alpha: 0.6)
        
        bottomLine.snp.remakeConstraints { (make) in
            make.bottom.equalTo(contentV.snp.bottom)
            make.centerX.equalTo(currentLab)
            make.size.equalTo(CGSize(width: 30, height: 3))
        }
        self.currentIndex = currentIndex
        
    }
    
    //reload
    func reloadData(newArray : [String]) {
        for subView in contentV.subviews {
            subView.removeFromSuperview()
        }
        titlelabels.removeAll()
        
        self.titles = newArray
        currentIndex = 0
        setupTitleLabels()
        setupBottomScrollLine()
        
    }
    
    
}
