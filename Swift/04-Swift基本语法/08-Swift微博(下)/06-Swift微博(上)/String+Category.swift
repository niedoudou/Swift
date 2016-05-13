//
//  String+Category.swift
//  06-Swift微博(上)


import Foundation

extension String {
    /// 处理时间
    static func stringWithTime(time: String) -> String {
        // 把字符串转化为NSDate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.dateFromString(time)
        // 返回计算好的时间
        return String.stringWithDate(date!)
    }
    
    static func stringWithDate(date: NSDate) -> String {
        // 返回发布人发布时间距离当前时间的秒数
        let timeInterval = -date.timeIntervalSinceNow
        // 错误时间错误
        if timeInterval < 0 {
            print("输入时间错误")
            return "error"
        }
        
        // 把时间转化为想要的时间
        if timeInterval < 60 {
            return "刚刚"
        }
        else if timeInterval <= 60*60 {
            let time = Int(timeInterval)/60
            return "\(time)分钟前"
        }
        else if timeInterval <= 60*60*24 {
            let time = Int(timeInterval)/60/60
            return "\(time)小时前"
        }
        else if timeInterval < 60*60*24*30 {
            let time = Int(timeInterval)/60/60/24
            return "\(time)天前"
        }
        else {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.stringFromDate(date)
        }
    }
}