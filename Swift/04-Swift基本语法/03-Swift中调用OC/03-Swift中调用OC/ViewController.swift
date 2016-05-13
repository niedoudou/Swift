//
//  ViewController.swift
//  03-Swift中调用OC


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let custiomView = CustomView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        custiomView.backgroundColor = UIColor.redColor()
        view.addSubview(custiomView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

