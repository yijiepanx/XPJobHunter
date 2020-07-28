//
//  RXJobInfoTableViewCell.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/27.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

class RXJobInfoTableViewCell: UITableViewCell {
    
    private lazy var celltitleLab : UILabel = {
        var lab = UILabel()
        lab.text = "自我简介"
        lab.textColor = UIColor.black.withAlphaComponent(0.85)
        lab.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return lab
    }()
    
    private lazy var cellSubtitleLab : UILabel = {
        var lab = UILabel()
        lab.text = "学校名称"
        lab.textColor = UIColor.black
        lab.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return lab
    }()
    
    private lazy var cellDateLab : UILabel = {
        var lab = UILabel()
        lab.text = "2015-2019"
        lab.textColor = UIColor.black.withAlphaComponent(0.5)
        lab.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return lab
    }()
    
    private lazy var cellDestitleLab : UILabel = {
        var lab = UILabel()
        lab.text = "视觉传达与设计  本科"
        lab.textColor = UIColor.black.withAlphaComponent(0.5)
        lab.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return lab
    }()
    
    private lazy var cellDesLab : UILabel = {
        var lab = UILabel()
        lab.text = "在这里填写您在校期间的经历，在这里填写您在校期间的经历在这里填写您在校期间的经历在这里填写您在校期间的经历"
        lab.textColor = UIColor.black.withAlphaComponent(0.5)
        lab.numberOfLines = 0
        lab.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return lab
    }()
    
    
// MARK: -  init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension RXJobInfoTableViewCell {
    
    func initSubviews() {
        
        addSubview(celltitleLab)
        celltitleLab.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(20)
            make.height.equalTo(22)
        }
        
        addSubview(cellSubtitleLab)
        cellSubtitleLab.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(celltitleLab.snp.bottom).offset(9)
            make.height.equalTo(20)
        }
        
        addSubview(cellDateLab)
        cellDateLab.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-22)
            make.centerY.equalTo(cellSubtitleLab)
            make.height.equalTo(20)
        }
        
        addSubview(cellDestitleLab)
        cellDestitleLab.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(cellSubtitleLab.snp.bottom)
            make.height.equalTo(20)
        }
        
        addSubview(cellDesLab)
        cellDesLab.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(cellDestitleLab.snp.bottom).offset(5)
//            make.height.equalTo(40)
        }
        
        let cellLine = UIView()
        cellLine.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        addSubview(cellLine)
        cellLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
        
    }
    
    
    
}
