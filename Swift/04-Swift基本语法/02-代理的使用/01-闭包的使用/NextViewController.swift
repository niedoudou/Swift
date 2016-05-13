//
//  NextViewController.swift
//  01-闭包的使用


import UIKit

// 声明一个代理(必须实现)
protocol NextDelegate: NSObjectProtocol {
    // 添加代理方法
    // 此代理方法默认为必须实现
    func clickWithString(string: String) -> Void
}

// 声明一个代理(可选实现)
@objc protocol NextOptionalDelegate: NSObjectProtocol {
    optional func clickOptionalWithString(string: String, number: Int) -> Void
}

class NextViewController: UIViewController {
    
    // 代理
    weak var delegate: NextDelegate?
    weak var optionalDelegate: NextOptionalDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化一个button
        let btn = UIButton(frame: CGRect(x: 80, y: 100, width: 60, height: 40))
        // 设置字体颜色
        btn.setTitleColor(UIColor.redColor(), forState: .Normal)
        // 设置显示文字
        btn.setTitle("返回", forState: .Normal)
        // 添加方法
        // 注意：Swift中的Selector直接传字符串
        btn.addTarget(self, action: "returnClick:", forControlEvents: .TouchUpInside)
        view.addSubview(btn)
    }
    
    func returnClick(button: UIButton)
    {
        // 回调代理(可选实现)
        // 一个参数
//        let flag = optionalDelegate?.respondsToSelector(Selector("clickOptionalWithString:")) ?? false
        // 两个参数
        let flag = optionalDelegate?.respondsToSelector(Selector("clickOptionalWithString:number:")) ?? false
        if flag {
            optionalDelegate?.clickOptionalWithString!("可选代理方法", number: 10086)
        }

        print("\(flag ? "有遵守代理" : "没有遵守代理")")
        
        // 回调代理(必须实现)
        delegate?.clickWithString(button.currentTitle!)
        
        // 此处的的?标示，如若navigationController有值，那么就执行popToRootViewControllerAnimated这歌方法，如果没有值为nil，就不执行这个方法
        navigationController?.popToRootViewControllerAnimated(true)
//        print("returnClick")
    }

    // 注意：OC中类被销毁的时候会调用dealloc 
    //      Swift中类被销毁回调用deinit
    deinit
    {
        print("控制器被销毁了")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
