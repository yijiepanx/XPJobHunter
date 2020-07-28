//
//  RXJobVCController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/21.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

private let jobvcCellId = "jobvcCellId"


class RXJobVCController: BaseViewController {

    private lazy var tableview: UITableView = {
        let tableview = UITableView(frame: CGRect(x: 0, y: kTopNavBarHeight, width: kScreenWidth, height: kScreenHeight-kTopNavBarHeight),style: .plain)
        tableview.showsVerticalScrollIndicator = false
        tableview.backgroundColor = .red
        tableview.rowHeight = 150;
        tableview.dataSource = self;
        tableview.separatorStyle = .none
        return tableview
    }()
    
    private lazy var topInfoHeader: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupUI()
       
    }
    


}



// MARK: -  UI
extension RXJobVCController {
    //自定义导航样式
    private func setupNavigationBar() {
        let containerBar = UIView(frame: CGRect(x: 0, y: kStatusBarHeight, width: kScreenWidth, height: kNavBarHright))
        containerBar.backgroundColor = .white
        view.addSubview(containerBar)
        
        let backBtn = UIButton(frame: CGRect(x: 10, y: 2, width: 40, height: 40))
        backBtn.backgroundColor = .cyan
        containerBar.addSubview(backBtn)
        backBtn.addTarget(self, action: #selector(self.customPopAction), for: .touchUpInside)
        
        let titleLab = UILabel(frame: CGRect(x: 80, y: 0, width: kScreenWidth-160, height: kNavBarHright))
        titleLab.text = "简历管理"
        titleLab.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLab.textAlignment = .center
        containerBar.addSubview(titleLab)
        
    }
    
    private func setupUI() {
        
        view.addSubview(tableview);
        
        let topContainer = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 126))
        topContainer.backgroundColor = .white
        
        
        let userNameLab = UILabel()
        userNameLab.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        userNameLab.textColor = UIColor.black.withAlphaComponent(0.85)
        userNameLab.text = "麦小麦"
        topContainer.addSubview(userNameLab)
        userNameLab.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(20)
            make.height.equalTo(40)
        }
        
        let userEdit = UIImageView()
        userEdit.backgroundColor = .cyan
        topContainer.addSubview(userEdit)
        userEdit.snp.makeConstraints { (make) in
            make.centerY.equalTo(userNameLab)
            make.left.equalTo(userNameLab.snp.right).offset(14)
            make.size.equalTo(CGSize(width: 15, height: 15))
        }
        
        let userInfoLab = UILabel()
        userInfoLab.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        userInfoLab.textColor = UIColor.black.withAlphaComponent(0.5)
        userInfoLab.text = "2年  25岁  本科  职场人"
        topContainer.addSubview(userInfoLab)
        userInfoLab.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(userNameLab.snp.bottom).offset(10)
            make.height.equalTo(17)
        }
        
        let userAvatar = UIImageView()
        userAvatar.backgroundColor = .cyan
        userAvatar.layer.cornerRadius = 40
        userAvatar.layer.masksToBounds = true
        topContainer.addSubview(userAvatar)
        userAvatar.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        let topLine = UIView()
        topLine.backgroundColor = UIColor.black.withAlphaComponent(0.06)
        topContainer.addSubview(topLine)
        topLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(6)
        }
        
        
        topInfoHeader = topContainer;
        tableview.tableHeaderView = topInfoHeader;
    }
    
}



extension RXJobVCController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: jobvcCellId)
        if cell == nil {
            cell = RXJobInfoTableViewCell.init(style: .default, reuseIdentifier: jobvcCellId)
        }
        
        return cell!
    }
    
    
}
