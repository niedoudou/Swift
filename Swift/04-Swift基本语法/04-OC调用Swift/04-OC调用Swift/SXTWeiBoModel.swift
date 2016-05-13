//
//  SXTWeiBoModel.swift
//  微博Swift


import UIKit

class SXTWeiBoModel: NSObject {
    /// 头像
    var icon: String?
    /// 姓名
    var name: String?
    /// 时间
    var timer: String?
    /// 来自
    var from: String?
    /// 图片数组
    var images: [String]?
    /// 微博哪痛
    var title: String?
    
    /// cell行高
    var rowHeight: CGFloat = 0
    
    // 获取微博数据
    class func loadDataArray() -> [SXTWeiBoModel]{
        let file = NSBundle.mainBundle().pathForResource("weibo", ofType: "plist")
        let data = NSArray(contentsOfFile: file!)! as Array
        
        var dataList = [SXTWeiBoModel]()
        for dict in data {
            let model = SXTWeiBoModel()
            model.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
            dataList.append(model)
        }
        
        return dataList
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
