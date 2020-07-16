//
//  RXJobContentController.swift
//  RecruitmentX
//
//  Created by 潘艺杰 on 2020/7/15.
//  Copyright © 2020 潘艺杰. All rights reserved.
//

import UIKit

private let kJobContentCellId = "kJobContentCellId"

class RXJobContentController: UIViewController {

    private var jobName : String  = ""
    
    lazy var jobTabView: UITableView = {
        let tabv = UITableView(frame: CGRect.zero, style: .plain)
        tabv.rowHeight = 170
        tabv.backgroundColor = UIColor.black.withAlphaComponent(0.06)
        tabv.showsVerticalScrollIndicator = false
        tabv.dataSource = self
        tabv.delegate = self
        tabv.separatorStyle = .none
        tabv.register(RXJobContentTableViewCell.self, forCellReuseIdentifier: kJobContentCellId)
        return tabv
    }()
    
    //构造函数
    init(title : String) {
        self.jobName = title
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(jobTabView)
        jobTabView.frame = view.bounds
        //根据父控件的尺寸缩放
        jobTabView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
    }
    


}


// MARK: -  tableview delegate
extension RXJobContentController : UITableViewDataSource ,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kJobContentCellId)
        if cell == nil {
            cell = RXJobContentTableViewCell(style: .default, reuseIdentifier: kJobContentCellId)
        }
        cell?.backgroundColor = UIColor.black.withAlphaComponent(0.03)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
