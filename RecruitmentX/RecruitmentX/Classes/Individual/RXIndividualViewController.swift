//
//  RXIndividualViewController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/14.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

class RXIndividualViewController: BaseViewController {

    private lazy var topContainer: UIImageView = {
        let imgV = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 264 * kIPhone6WidthScale))
        imgV.isUserInteractionEnabled = true
        imgV.backgroundColor = UIColor.white
        return imgV
    }()
    
    private lazy var userAvatarView : UIImageView = {
        let imgV = UIImageView()
        imgV.isUserInteractionEnabled = true
        imgV.backgroundColor = UIColor.Hex(hexValue: 0x71E2DD)
        imgV.layer.cornerRadius = 40
        imgV.layer.masksToBounds = true
        return imgV
    }()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.black.withAlphaComponent(0.85), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        btn.setTitle("点击登录", for: .normal)
        
        return btn
    }()
    
    lazy var desLab: UILabel = {
        let lab = UILabel()
        lab.text = "体验后更多服务"
        lab.textColor = UIColor.black.withAlphaComponent(0.5)
        lab.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lab.textAlignment = .center
        return lab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }

}


// MARK: -  UI
extension RXIndividualViewController {
    
    private func setupUI() {
        view.addSubview(topContainer)
        topContainer.addSubview(userAvatarView)
        userAvatarView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(10)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        topContainer.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(userAvatarView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(22)
        }
        topContainer.addSubview(desLab)
        desLab.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(2)
            make.centerX.equalToSuperview()
            make.height.equalTo(17)
        }
        
        let line1 = UIView()
        line1.backgroundColor = UIColor.black.withAlphaComponent(0.06)
        view.addSubview(line1)
        line1.snp.makeConstraints { (make) in
            make.top.equalTo(topContainer.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(6)
        }
        
        let cellContainer = UIView()
        view.addSubview(cellContainer)
        cellContainer.backgroundColor = .white
        cellContainer.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(65)
        }
        let cellTapGes = UITapGestureRecognizer(target: self, action: #selector(cellTapAction))
        cellContainer.addGestureRecognizer(cellTapGes)
        
        let iconImg = UIImageView()
        cellContainer.addSubview(iconImg)
        iconImg.backgroundColor = .red
        iconImg.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(21)
            make.size.equalTo(CGSize(width: 23, height: 23))
        }
        
        let celllab = UILabel()
        celllab.text = "简历管理"
        celllab.textColor = UIColor.black.withAlphaComponent(0.85)
        celllab.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        cellContainer.addSubview(celllab)
        celllab.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(iconImg.snp.right).offset(20)
        }
        
        let detailIconImg = UIImageView()
        cellContainer.addSubview(detailIconImg)
        detailIconImg.backgroundColor = .red
        detailIconImg.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-21)
            make.size.equalTo(CGSize(width: 23, height: 23))
        }
        
        let line2 = UIView()
        line2.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.addSubview(line2)
        line2.snp.makeConstraints { (make) in
            make.top.equalTo(cellContainer.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        
    }
    
}


// MARK: -  Actions
extension RXIndividualViewController {
    
    @objc private func cellTapAction() {
        navigationController?.pushViewController(RXJobVCController(), animated: true)
    }
    
    
}
