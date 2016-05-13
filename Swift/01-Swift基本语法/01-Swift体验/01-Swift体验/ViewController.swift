//
//  ViewController.swift
//  01-Swift体验


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // UIView() 等于OC中的 [[UIView alloc] init];
        // 创建一个view，并设置好frame
        let view1 = UIView(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
        
        // UIColor.redColor() 等于OC中的 [UIColor redColor];
        view1.backgroundColor = UIColor.redColor()
        
        // view.addSubview(view1) 等于OC中的 [self.view addSubview:view1];
        view.addSubview(view1)
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

