//
//  RXJobFilterController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/14.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

private let filterJobCellId = "filterJobCellId"
private let filterJobSectionId = "filterJobSectionId"
private let itemH : CGFloat = 30.0 * kIPhone6WidthScale
private let itemW : CGFloat = (kScreenWidth - 60) / CGFloat(3)

private let bottomPodH : CGFloat = 50.0

class RXJobFilterController: BaseViewController {
    
    //属性
    lazy var collectionView: UICollectionView = {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.minimumLineSpacing = 10
        layoutFlow.minimumInteritemSpacing = 10
        layoutFlow.itemSize = CGSize(width: itemW, height: itemH)
        layoutFlow.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layoutFlow.headerReferenceSize = CGSize(width: kScreenWidth, height: 28 * kIPhone6WidthScale)
        
        let collect = UICollectionView(frame: CGRect(x: 0, y: kTopNavBarHeight + 20, width: kScreenWidth, height: kScreenHeight - (kTopNavBarHeight + bottomPodH + kBottomSafeAreaHeight)), collectionViewLayout: layoutFlow)
        collect.backgroundColor = .white
        collect.register(UICollectionViewCell.self, forCellWithReuseIdentifier: filterJobCellId)
        collect.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: filterJobSectionId)
        collect.dataSource = self
        
        return collect
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}


// MARK: -  UI
extension RXJobFilterController {
    
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
        titleLab.text = "筛选"
        titleLab.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLab.textAlignment = .center
        containerBar.addSubview(titleLab)
        
    }
    
    private func setupUI() {
        view.addSubview(collectionView)
        //底部按钮
        let bottomBar = UIView(frame: CGRect(x: 0, y: kScreenHeight - (bottomPodH + kBottomSafeAreaHeight), width: kScreenWidth, height: bottomPodH))
        bottomBar.backgroundColor = .white
        view.addSubview(bottomBar)
        
        let resetBtn = UIButton(frame: CGRect(x: 20, y: 5, width: itemW, height: 40))
        resetBtn.setTitle("重置", for: .normal)
        resetBtn.setTitleColor(UIColor.black.withAlphaComponent(0.45), for: .normal)
        resetBtn.backgroundColor = UIColor.black.withAlphaComponent(0.06)
        resetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        bottomBar.addSubview(resetBtn)
        
        let confirmBtn = UIButton(frame: CGRect(x: itemW + 30, y: 5, width: (itemW * 2) + 10, height: 40))
        bottomBar.addSubview(confirmBtn)
        confirmBtn.setTitle("确定", for: .normal)
        confirmBtn.setTitleColor(UIColor.white, for: .normal)
        confirmBtn.backgroundColor = UIColor.Hex(hexValue: 0x37C2BC)
        confirmBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
    }
    
}


// MARK: -  collection delegate
extension RXJobFilterController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterJobCellId, for: indexPath)
//        cell.backgroundColor = UIColor.randomColor()
        
        for subvv in cell.contentView.subviews {
            subvv.removeFromSuperview()
        }
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
        cell.contentView.addSubview(btn)
        btn.setTitle("全部", for: .normal)
        btn.titleLabel?.font =  UIFont.systemFont(ofSize: 12, weight: .medium)
        btn.setTitleColor(.white, for: .selected)
        btn.setTitleColor(UIColor.black.withAlphaComponent(0.45), for: .normal)
        btn.setBackgroundImage(ImageWithColor(color: UIColor.Hex(hexValue: 0x37C2BC)), for: .selected)
        btn.setBackgroundImage(ImageWithColor(color: UIColor.black.withAlphaComponent(0.06)), for: .normal)
        btn.layer.cornerRadius = 4
        btn.layer.masksToBounds = true
        
        if indexPath.row == 0 {
            btn.isSelected = true
        } else {
            btn.isSelected = false
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: filterJobSectionId, for: indexPath)
        header.backgroundColor = .white
        
        for subvv in header.subviews {
            subvv.removeFromSuperview()
        }
        
        let titleLab = UILabel(frame: CGRect(x: 20, y: 0, width: kScreenWidth - 40, height: header.frame.size.height))
        titleLab.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        titleLab.textColor = UIColor.black.withAlphaComponent(0.8)
        titleLab.text = "工作经验"
        header.addSubview(titleLab)
        
        
        return header
        
    }
    

    
}
