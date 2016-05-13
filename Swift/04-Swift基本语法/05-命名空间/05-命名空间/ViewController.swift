//
//  ViewController.swift
//  05-命名空间


import UIKit

/*
namespace默认是项目名称，同一个命名空间全局共享

修改namespace
-> Build Settings中搜索product name,即可修改
注意：新改的名字不能含有“中文”, 不能以“数字”开头,不能有“-”
*/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 通过一个字符串来创建一个类(ViewController)
        // 1.动态的获取命名空间的名字
        let str: String = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String

        // 2.通过字符串得到一个AnyClass
        let cls: AnyClass = NSClassFromString(str + "." + "ViewController")!
        
        // 3.获取控制器的class
        let clsVC = cls as! UIViewController.Type
        
        // 4.通过控制器的class来实例化对象
        let viewVC = clsVC.init()
        
        print("viewVC: \(viewVC)")
        print("self: \(self)")
        
        let model = Model()
        print(model)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

