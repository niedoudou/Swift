//
//  ViewController.swift
//  06-Swift微博(上)


import UIKit

class ViewController: UITableViewController {
    // 懒加载数据模型
    lazy var dataList: [SXTWeiBoModel] = {
        return SXTWeiBoModel.loadDataArray()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // iOS自动估算高
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
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
}




