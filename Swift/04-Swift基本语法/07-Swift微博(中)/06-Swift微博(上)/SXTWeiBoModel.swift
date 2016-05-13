//
//  SXTWeiBoModel.swift
//  06-Swift微博(上)


import UIKit

class SXTWeiBoModel: NSObject {
    /// 图片数组
    var images: [String]?
    /// 来自
    var from: String?
    /// 时间
    var timer: String?
    
    /// 处理时间和来自
    var sub: String? {
        get {
            return timerStr! + " " + from!
        }
    }
    
    /// 处理好的时间
    var timerStr: String? {
        get {
            return String.stringWithTime(timer!)
        }
    }
    
    /// 内容
    var title: String?
    /// 发布人
    var name: String?
    /// 头像
    var icon: String?
    
    class func loadDataArray() -> [SXTWeiBoModel] {
        // 1.获取数据地址
        let file = NSBundle.mainBundle().pathForResource("weibo", ofType: "plist")
        // 2.读取plist文件中的数据
        let data: Array = NSArray(contentsOfFile: file!)! as Array
        // 3.初始化存放数据模型的数组
        var arrM: [SXTWeiBoModel] = Array()
        
        // 4.遍历数组，对应数据模型
        for dict in data {
            // 4.0 初始化数据模型
            let model = SXTWeiBoModel()
            // 4.1 KVC给数据模型赋值
            model.setValuesForKeysWithDictionary(dict as! [String : AnyObject])
            // 4.2 把数据模型添加进入数组
//            arrM += [model]
            arrM.append(model)
        }
        
        return arrM
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
}
