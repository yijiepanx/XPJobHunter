//
//  RXJobDetailViewController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/16.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

private let bottomBarH : CGFloat = 50
private let bottomItemW : CGFloat = (kScreenWidth - 60) / 3
private let bottomItemH : CGFloat = 40.0

class RXJobDetailViewController: BaseViewController {
    //data
    private let bottomItemTitles  = ["我要分享", "我要申请", "我要推荐"]
    
    // lazy init
    private lazy var scrollView: UIScrollView = {
        let scrollv = UIScrollView(frame: CGRect(x: 0, y: kTopNavBarHeight, width: kScreenWidth, height: kScreenHeight - (bottomBarH + kBottomSafeAreaHeight + kTopNavBarHeight)))
        scrollv.backgroundColor = .cyan
        return scrollv
    }()
    
    private lazy var containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    private lazy var jobNameLab: UILabel = {
        let lab = UILabel()
        lab.text = "产品经理"
        lab.textColor = UIColor.black.withAlphaComponent(0.85)
        lab.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        return lab
    }()
    private lazy var salaryLab: UILabel = {
        let lab = UILabel()
        lab.text = "15-20K·13薪"
        lab.textAlignment = .right
        lab.textColor = UIColor.black.withAlphaComponent(0.65)
        lab.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return lab
    }()
    private lazy var locationBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("上海", for: .normal)
        btn.setTitleColor(UIColor.black.withAlphaComponent(0.65), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        btn.setImage(ImageWithColor(color: .red, size: CGSize(width: 20, height: 20)), for: .normal)
        return btn
    }()
    private lazy var workDateBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("3-5年", for: .normal)
        btn.setTitleColor(UIColor.black.withAlphaComponent(0.65), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        btn.setImage(ImageWithColor(color: .red, size: CGSize(width: 20, height: 20)), for: .normal)
        return btn
    }()
    private lazy var eduBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("大专", for: .normal)
        btn.setTitleColor(UIColor.black.withAlphaComponent(0.65), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        btn.setImage(ImageWithColor(color: .red, size: CGSize(width: 20, height: 20)), for: .normal)
        return btn
    }()

    private lazy var jobDesTitleLab: UILabel = {
        let lab = UILabel()
        lab.text = "职位详情"
        lab.textColor = UIColor.black.withAlphaComponent(0.85)
        lab.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return lab
    }()
    
    private lazy var jobDesLab: UILabel = {
        let lab = UILabel()
        lab.text = ""
        lab.backgroundColor = .white
        lab.numberOfLines = 0
        lab.textColor = UIColor.black.withAlphaComponent(0.65)
        lab.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        let str = "1.全面负责收集管理用户/客户需求、进行市场和竞争分析、制定创新性的、可规模化的商业产品规划和设计\n2.与运营团队配合,对产品的推广运营进行管理，使产品能够在体系内发挥效用，挖掘业务发展潜力\n3.负责付费用户增长趋势，根据用户行为和数据统计进行有效产品运营策略的迭代\n4.负责在项目推进过程中的跨部门协调沟通工作,并协调/推动研发团队按时完成产品开发、高质量上线;\n1.全面负责收集管理用户/客户需求、进行市场和竞争分析、制定创新性的、可规模化的商业产品规划和设计\n2.与运营团队配合,对产品的推广运营进行管理，使产品能够在体系内发挥效用，挖掘业务发展潜力\n3.负责付费用户增长趋势，根据用户行为和数据统计进行有效产品运营策略的迭代\n4.负责在项目推进过程中的跨部门协调沟通工作,并协调/推动研发团队按时完成产品开发、高质量上线;"
        let parag = NSMutableParagraphStyle()
        parag.lineSpacing = 4
        let style = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .medium),NSAttributedString.Key.paragraphStyle :parag]
        lab.attributedText = NSAttributedString(string: str, attributes: style)
        
        return lab
    }()
    
    private lazy var labelMaskView : UIView = {
        let v = UIView()
        //绘制渐变层
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: kScreenWidth - 40, height: 50)
        gradientLayer.colors = [UIColor.init(white: 1, alpha: 0).cgColor, UIColor.init(white: 1, alpha: 1).cgColor]
        gradientLayer.locations = [0 ,1.0]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 0, y: 1)
        v.layer.insertSublayer(gradientLayer, at: 0)
        
        return v
    }()
    
    private lazy var floderBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("查看全部", for: .normal)
        btn.setTitleColor(UIColor.black.withAlphaComponent(0.65), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupUI()
        setupBottomBar()
    }
    
    
}


// MARK: -  UI
extension RXJobDetailViewController {
    
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
        titleLab.text = "职位详情"
        titleLab.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLab.textAlignment = .center
        containerBar.addSubview(titleLab)
        
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.leading.top.bottom.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        containerView.addSubview(salaryLab)
        salaryLab.snp.makeConstraints { (make) in
            make.top.equalTo(35)
            make.right.equalTo(-20)
            
        }
        
        containerView.addSubview(jobNameLab)
        jobNameLab.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.height.equalTo(40)
            make.right.equalTo(salaryLab.snp.left).offset(-20)
        }
                
        containerView.addSubview(locationBtn)
        locationBtn.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(jobNameLab.snp.bottom).offset(9)
            make.height.equalTo(20)
        }
        locationBtn.xpLayoutButtonEdgeInsetStyle(style: .left, imageTitleGap: 4)
        
        containerView.addSubview(workDateBtn)
        workDateBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(locationBtn)
            make.left.equalTo(locationBtn.snp.right).offset(18)
        }
        (workDateBtn).xpLayoutButtonEdgeInsetStyle(style: .left, imageTitleGap: 4)
        
        containerView.addSubview(eduBtn)
        eduBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(locationBtn)
            make.left.equalTo(workDateBtn.snp.right).offset(18)
        }
        eduBtn.xpLayoutButtonEdgeInsetStyle(style: .left, imageTitleGap: 4)
        
        containerView.addSubview(jobDesTitleLab)
        jobDesTitleLab.snp.makeConstraints { (make) in
            make.leading.equalTo(20)
            make.top.equalTo(locationBtn.snp.bottom).offset(30)
            make.height.equalTo(28)
        }
        
        containerView.addSubview(jobDesLab)
        jobDesLab.snp.makeConstraints { (make) in
            make.top.equalTo(jobDesTitleLab.snp.bottom).offset(19)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(213)
        }
        
        jobDesLab.addSubview(labelMaskView)
        labelMaskView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        
        containerView.addSubview(floderBtn)
        floderBtn.snp.makeConstraints { (make) in
            make.top.equalTo(jobDesLab.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.bottom.equalTo(floderBtn).offset(0)
        }
        
        
    }
    
    private func setupBottomBar() {
        let bottomBar = UIView()
        view.addSubview(bottomBar)
        bottomBar.backgroundColor = .white
        bottomBar.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-kBottomSafeAreaHeight)
            make.height.equalTo(50)
        }
        
        for (index, title) in bottomItemTitles.enumerated() {
            let btn = UIButton()
            bottomBar.addSubview(btn)
            btn.backgroundColor = UIColor.Hex(hexValue: 0x37C2BC)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            btn.setTitle(title, for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(CGFloat(20) + (bottomItemW + CGFloat(10)) * CGFloat(index))
                make.size.equalTo(CGSize(width: bottomItemW, height: bottomItemH))
            }
            
        }
        
        
        
    }
    

}
