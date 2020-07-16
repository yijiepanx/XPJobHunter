//
//  RXHomeViewController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/14.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

private let kHomeTopBarHeight : CGFloat = kStatusBarHeight + 44
private let kHomeMiddleBarHeight : CGFloat = 50



class RXHomeViewController: BaseViewController {
    
    //页面数据
    var jobArray : [String] = [String]()
    var filterArray : [String] = [String]()
    var contentVCArray : [RXJobContentController] = [RXJobContentController]()
    
    
    //属性
    private lazy var homeTopBar: UIImageView = {
        let topImage = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kHomeTopBarHeight))
        topImage.isUserInteractionEnabled = true
        topImage.contentMode = .scaleAspectFit
        topImage.backgroundColor = UIColor.Hex(hexValue: 0x37C2BC)
        return topImage
    }()
    
    private lazy var pageTitleView: RXPageTitleView = { [weak self] in
        let titleViewFrame = CGRect(x: 0, y: kHomeTopBarHeight-43, width: kScreenWidth-50, height: 43);
        let titles = ["UI设计师"]
        let v = RXPageTitleView(frame: titleViewFrame, titles: titles)
//        v.backgroundColor = .blue
        v.delegate = self
        return v
    }()
    
    private lazy var homeMiddleBar: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: kHomeTopBarHeight, width: kScreenWidth, height: kHomeMiddleBarHeight))
        v.backgroundColor = .white
        let line = UIView(frame: CGRect(x: 0, y: kHomeMiddleBarHeight-1, width: kScreenWidth, height: 1))
        line.backgroundColor = UIColor.HexA(hexValue: 0x000000, a: 0.15)
        v.addSubview(line)
        return v
    }()
    
    private lazy var titleSegment: RXTitleSegmentView = {
        let titseg = RXTitleSegmentView(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 80, height: kHomeMiddleBarHeight-1), titles: ["推荐"])
        return titseg
    }()
    
    
    lazy var homeContentView : RXPageContentView = {
        let v = RXPageContentView(frame: CGRect(x: 0, y: kHomeTopBarHeight + kHomeMiddleBarHeight, width: kScreenWidth, height: kScreenHeight - (kHomeTopBarHeight + kHomeMiddleBarHeight + CGFloat(kTabbarHeight))), childVCs: [RXJobContentController](), parentVC: self)
        v.backgroundColor = .blue
        v.delegate = self
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        
        //数据请求
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }
   
}

// MARK: -  UI
extension RXHomeViewController {
    private func setupUI() {
        //设置顶部自定义bar
        view.addSubview(homeTopBar)
        homeTopBar.addSubview(pageTitleView)
        
        let editBtn = UIButton(frame: CGRect(x: kScreenWidth-50, y: kHomeTopBarHeight-43, width: 50, height: 43))
        editBtn.backgroundColor = .cyan
        homeTopBar.addSubview(editBtn)
        editBtn.addTarget(self, action: #selector(editBtnAction), for: .touchUpInside)
        
        //自定义中间筛选bar
        view.addSubview(homeMiddleBar)
        homeMiddleBar.addSubview(titleSegment)
        
        let verLine = UIView()
        verLine.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        homeMiddleBar.addSubview(verLine)
        verLine.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-80)
            make.size.equalTo(CGSize(width: 1, height: 20))
            
        }
        let filterBtn = UIButton()
        filterBtn.backgroundColor = UIColor.black.withAlphaComponent(0.06)
        filterBtn.setTitle("筛选", for: .normal)
        filterBtn.setTitleColor(UIColor.black.withAlphaComponent(0.45), for: .normal)
        filterBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        filterBtn.layer.cornerRadius = 4
        filterBtn.layer.masksToBounds = true
        homeMiddleBar.addSubview(filterBtn)
        filterBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 50, height: 30))
        }
        
        
        //contentView
        view.addSubview(homeContentView)
    }
    

    
    //statusBar in vc setting
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


// MARK: -  事件响应
extension RXHomeViewController {
    
       @objc private func editBtnAction() {
           navigationController?.pushViewController(RXJobFilterController(), animated: true)
       }

}


// MARK: -  pageTitleDelegate
extension RXHomeViewController : RXPageTitleViewDelegate {
    func pageTitleView(pageTitleView: RXPageTitleView, selectedIndex: Int) {
        print(selectedIndex)
        //contenView联动
        homeContentView.pageContentViewScroll(to: selectedIndex)
    }
    
    
}

// MARK: -  pageContentDelegate
extension RXHomeViewController : RXPageContentViewDelegate {
    func pagrContentViewScroll(to currentIndex: Int) {
        pageTitleView.pageTitleViewSelect(currentIndex: currentIndex)
    }
}



// MARK: -  数据请求
extension RXHomeViewController {
    private func loadData() {
        
        
        let jobArr = ["UI设计师","产品经理","Java","Swift","C#工程师"]
        jobArray = jobArr
        pageTitleView.reloadData(newArray: jobArr)
        
        //根据job数组创建视图
        var vcArr = [RXJobContentController]()
        for title in jobArr {
            let jobvc = RXJobContentController(title: title)
            vcArr.append(jobvc)
        }
        contentVCArray = vcArr
        homeContentView.reloadData(newData: vcArr)

        
        let filterArr = ["推荐","在校/应届","本科","8K以下","全职"]
        filterArray = filterArr
        titleSegment.reloadData(newData: filterArr)
        
        
    }
    
    
}
