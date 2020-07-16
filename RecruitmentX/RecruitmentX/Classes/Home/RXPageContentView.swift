//
//  RXPageContentView.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/15.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

protocol RXPageContentViewDelegate : AnyObject {
    func pagrContentViewScroll(to currentIndex : Int)
}

private let kHomeCollectionCellId = "kHomeCollectionCellId"

class RXPageContentView: UIView {
    //属性
    weak var delegate : RXPageContentViewDelegate?
    
    private var childVCs : [UIViewController]
    private weak var parentVC : UIViewController?
    
    lazy var collectView: UICollectionView = {[weak self] in
        
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.minimumLineSpacing = 0
        layoutFlow.minimumInteritemSpacing = 0
        layoutFlow.itemSize = self!.bounds.size
        layoutFlow.scrollDirection = .horizontal
        
        let collectv = UICollectionView(frame: self!.bounds, collectionViewLayout: layoutFlow)
        collectv.showsHorizontalScrollIndicator = false
        collectv.backgroundColor = .purple
        collectv.isPagingEnabled = true
        collectv.bounces = false
        collectv.dataSource = self
        collectv.delegate = self
        collectv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kHomeCollectionCellId)
        
        return collectv
    }()
    
    // MARK: -  构造
    init(frame : CGRect, childVCs :[UIViewController], parentVC : UIViewController) {
        self.childVCs = childVCs
        self.parentVC = parentVC
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

// MARK: -  UI
extension RXPageContentView {
    private func setupUI() {
        //将子控制器加入父视图
        for vc in childVCs {
            parentVC?.addChild(vc)
        }
        addSubview(collectView)
        
    }
    
    
}


// MARK: -  collectionView delegate
extension RXPageContentView : UICollectionViewDataSource ,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kHomeCollectionCellId, for: indexPath)
        cell.backgroundColor = .white
        
        for subV in cell.contentView.subviews {
            subV.removeFromSuperview()
        }
        
        let subVc = childVCs[indexPath.item]
        subVc.view.frame = cell.contentView.frame
        cell.contentView.addSubview(subVc.view)
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //未来设置滑动动画
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
//        print(index)

        delegate?.pagrContentViewScroll(to: index)
    }
    
    
}


// MARK: -  外部调用方法
extension RXPageContentView {
    func pageContentViewScroll(to currentIndex : Int) {
        let offset = collectView.frame.width * CGFloat(currentIndex)
        collectView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
    }
    
    func reloadData(newData : [UIViewController]) {
//        guard let pvc = parentVC else { return }
        for subvc in childVCs {
            subvc.removeFromParent()
        }
        childVCs = newData

        for vc in childVCs {
            parentVC?.addChild(vc)
        }
        collectView.reloadData()
        
    }
    
}
