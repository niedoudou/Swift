//
//  NextViewController.swift
//  01-闭包的使用


import UIKit

class NextViewController: UIViewController {

    // 声明一个全局的闭包
    // 1.测试循环引用
    var weakBlock: ((title: String) -> Void)?
    
    // 2.回调传值
    var block: ((string: String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 测试闭包的循环引用
        // 注意：使用闭包时要注意循环引用内存释放不掉的问题
        // 注意：此处的weakSelf是一个可选类型
        weak var weakSelf = self
        weakBlock = {
            (title: String) -> Void in
            // 在闭包中不能省略self
            weakSelf!.title = title
        }
        // 调用闭包
        weakBlock!(title: "下一页")
        
        
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
        // 可选绑定
        if let tmpBlock = block {
            tmpBlock(string:"block回调")
        }
        
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
