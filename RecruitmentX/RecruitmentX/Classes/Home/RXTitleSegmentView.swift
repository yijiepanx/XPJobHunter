//
//  RXTitleSegmentView.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/15.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

class RXTitleSegmentView: UIView {
    
    private var titles : [String]
    private var currentIndex : Int = 0
    
    private lazy var scrollView: UIScrollView = {
        let scrollv = UIScrollView()
        scrollv.backgroundColor = .white
        scrollv.showsHorizontalScrollIndicator = false
        scrollv.scrollsToTop = false
        scrollv.bounces = false
        return scrollv
    }()
    //用于自动布局计算scrollview contentsize
    private lazy var contentV : UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    init(frame : CGRect, titles : [String]) {
        self.titles = titles
        super.init(frame: frame)
        
        setupUI()
        setupSubItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


// MARK: -  UI
extension RXTitleSegmentView {
    func setupUI() {
        addSubview(scrollView)
        scrollView.frame = bounds
        scrollView.addSubview(contentV)
        contentV.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalToSuperview().inset(0)
            make.height.equalToSuperview()
        }
        
        
        
    }
    
    func setupSubItems() {
        //subButton
        var suffixBtn : UIButton? = nil
        
        for (index,title) in titles.enumerated() {
            //sublabel init
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.tag = index
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            button.setTitleColor(UIColor.black.withAlphaComponent(0.45), for: .normal)
            button.backgroundColor = UIColor.black.withAlphaComponent(0.06)
            button.layer.cornerRadius = 4
            button.layer.masksToBounds = true
            contentV.addSubview(button)
            if index == currentIndex {
                button.setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
                button.backgroundColor = UIColor.Hex(hexValue: 0x37C2BC)
            }
            
            let strSize = (title as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 30), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .medium)], context: nil).size.width
            
            if suffixBtn == nil {
                button.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalToSuperview().offset(20)
                    make.size.equalTo(CGSize(width: strSize + 24, height: 30))
                }
                suffixBtn = button
            } else {
                button.snp.makeConstraints { (make) in
                    make.centerY.equalToSuperview()
                    make.left.equalTo(suffixBtn!.snp.right).offset(10)
                    make.size.equalTo(CGSize(width: strSize + 24, height: 30))
                }
                suffixBtn = button
            }
            
            //                titlelabels.append(button)
        }
        guard let _ = suffixBtn else { return }
        contentV.snp.makeConstraints { (make) in
            make.right.equalTo(suffixBtn!)
        }
    }
    


}


// MARK: -  外部调用方法
extension RXTitleSegmentView {
    func reloadData(newData : [String]) {
        self.titles = newData
        currentIndex = 0
        for subv in contentV.subviews {
            subv.removeFromSuperview()
        }
        setupSubItems()
        
    }
    
    
}
