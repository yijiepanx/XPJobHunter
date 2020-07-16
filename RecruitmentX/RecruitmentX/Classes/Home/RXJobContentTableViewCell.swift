//
//  RXJobContentTableViewCell.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/15.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

class RXJobContentTableViewCell: UITableViewCell {
    
    //懒加载控件
    
    lazy var jobNameLab: UILabel = {
        let lab = UILabel()
        lab.text = "产品经理"
        lab.textColor = UIColor.black.withAlphaComponent(0.85)
        lab.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return lab
    }()
    lazy var salaryLab: UILabel = {
        let lab = UILabel()
        lab.text = "15-20K·13薪"
        lab.textColor = UIColor.black.withAlphaComponent(0.65)
        lab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lab
    }()
    lazy var companyLab: UILabel = {
        let lab = UILabel()
        lab.text = "极兔速递"
        lab.textColor = UIColor.black.withAlphaComponent(0.65)
        lab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lab
    }()
    lazy var companySizeLab: UILabel = {
        let lab = UILabel()
        lab.text = "10000人以上"
        lab.textColor = UIColor.black.withAlphaComponent(0.65)
        lab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lab
    }()
    lazy var companyDesLab: UILabel = {
        let lab = UILabel()
        lab.text = "未融资"
        lab.textColor = UIColor.black.withAlphaComponent(0.65)
        lab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lab
    }()
    lazy var filterContent: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.06)
        return view
    }()
    
    lazy var jobDesLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.black.withAlphaComponent(0.45)
        lab.numberOfLines = 0
        lab.font = UIFont.systemFont(ofSize: 10, weight: .medium)
//        lab.text = "1、全面负责收集管理用户/客户需求、进行市场和竞争分析、制定创新性的、可规模化的商业产品规划和…"
        
        let str = "1、全面负责收集管理用户/客户需求、进行市场和竞争分析、制定创新性的、可规模化的商业产品规划和…"
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.lineSpacing = 6
        let attribute = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10, weight: .medium), NSAttributedString.Key.paragraphStyle : paraStyle]
        lab.attributedText = NSAttributedString(string: str, attributes: attribute)
        
        return lab
    }()
    
    lazy var locationLab: UILabel = {
        let lab = UILabel()
        lab.text = "上海"
        lab.textColor = UIColor.black.withAlphaComponent(0.65)
        lab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return lab
    }()
    
    

    // INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RXJobContentTableViewCell {
    
    private func setupUI() {
        contentView.snp.remakeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0))
        }
        contentView.backgroundColor = .white
        
        contentView.addSubview(jobNameLab)
        contentView.addSubview(salaryLab)
        contentView.addSubview(companyLab)
        contentView.addSubview(companySizeLab)
        contentView.addSubview(companyDesLab)
        contentView.addSubview(filterContent)
        contentView.addSubview(jobDesLab)
        contentView.addSubview(locationLab)
        
        layoutUI()
    }
    
    private func layoutUI() {
        salaryLab.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(19)
            make.right.equalToSuperview().offset(-21)
        }
        
        jobNameLab.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(21)
            make.right.lessThanOrEqualTo(salaryLab.snp.left)
            make.height.equalTo(28)
        }
        
        companyLab.snp.makeConstraints { (make) in
            make.left.equalTo(jobNameLab)
            make.top.equalTo(jobNameLab.snp.bottom).offset(10)
            make.height.equalTo(20)
        }
        
        companySizeLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(companyLab)
            make.left.equalTo(companyLab.snp.right).offset(10)
        }
        
        companyDesLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(companyLab)
            make.left.equalTo(companySizeLab.snp.right).offset(10)
        }
        
        filterContent.snp.makeConstraints { (make) in
            make.top.equalTo(companyLab.snp.bottom).offset(10)
            make.left.equalTo(jobNameLab)
            make.right.equalToSuperview().offset(-21)
            make.height.equalTo(25)
        }
        
        locationLab.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-21)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        jobDesLab.snp.makeConstraints { (make) in
            make.top.equalTo(filterContent.snp.bottom).offset(10)
            make.left.equalTo(jobNameLab)
            make.right.equalTo(locationLab.snp.left).offset(-49)
        }
        
        
    }
    
    
    
}
