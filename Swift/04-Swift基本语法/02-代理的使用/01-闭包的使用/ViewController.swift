//
//  ViewController.swift
//  01-闭包的使用


import UIKit

class ViewController: UIViewController, NextDelegate, NextOptionalDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
    }
    

    @IBAction func nextPage() {
        performSegueWithIdentifier("nextPage", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 1.判断标识
        if segue.identifier == "nextPage" {
            // 2.获取对应的控制器
            let nextVC = segue.destinationViewController as! NextViewController
            // 3.遵守代理
            nextVC.delegate = self
            nextVC.optionalDelegate = self
        }
    }
    
    // MARK: - 代理方法
    func clickWithString(string: String) {
        print("代理回调值： \(string)")
    }
    
    func clickOptionalWithString(string: String, number: Int) {
        print("可选实现的代理回调： \(string), number: \(number)")
    }

}

