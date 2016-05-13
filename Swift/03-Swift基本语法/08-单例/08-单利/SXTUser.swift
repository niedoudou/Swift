//
//  SXTUser.swift
//  08-单利


import UIKit

class SXTUser: NSObject {

    /*
    // 在类方法中用static来修饰变量
    static var once_t: dispatch_once_t = 0
    static var user: SXTUser?
    class func shareUser() -> SXTUser
    {
        dispatch_once(&once_t) { () -> Void in
            user = SXTUser()
        }
        
        return user!
    }
    */
    
    // 在Swift中let修饰的对象是线程安全的
    static let user = SXTUser()
    class func shareUser() -> SXTUser {
        return user
    }
}
