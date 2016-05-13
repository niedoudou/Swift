//
//  ViewController.swift
//  01-闭包的使用


import UIKit

class ViewController: UIViewController {

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
            // 3.block回调
            nextVC.block = {
                (string: String) -> Void in
                print("回调输出：\(string)")
            }
        }
    }

}

