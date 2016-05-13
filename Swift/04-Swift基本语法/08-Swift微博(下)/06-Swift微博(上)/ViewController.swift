//
//  ViewController.swift


import UIKit

class ViewController: UITableViewController {
    // 懒加载数据模型
    lazy var dataList: [SXTWeiBoModel] = {
        return SXTWeiBoModel.loadDataArray()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 注册通知
        NSNotificationCenter.defaultCenter().addObserverForName(kImageNameNotificationKey, object: nil, queue: NSOperationQueue.mainQueue()) { (note: NSNotification) -> Void in
            let imageName = note.userInfo!["imageName"]
            print("你点中的图片为：\(imageName)")
        }
        
        tableView.allowsSelection = false
        // iOS自动估算高
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

// 等于OC里面的类别
// apple建议代理方法写在类别中
extension ViewController {
    /// MARK - tableView数据源代理
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 1.从缓存池获取cell
        let cell: SXTWeiBoCell = tableView.dequeueReusableCellWithIdentifier("cellID") as! SXTWeiBoCell
        
        // 2.设置数据
        cell.model = dataList[indexPath.row]
        
        return cell
    }
    
    /// MARK - tableView代理
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return dataList[indexPath.row].cellHeight ?? 0
    }

}




