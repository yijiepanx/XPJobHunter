# XPJobHunter
仿Boss直聘页面布局，页面pagecontent联动效果


采用snapkit布局控件
pagetitileView待添加动画效果

控件数据可根据请求数据分别请求，根据pagetitle生成对应pagecontent


(```)
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
(```)
