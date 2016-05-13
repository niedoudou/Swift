//
//  ViewController.swift
//  08-单利


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...1000 {
            dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
                let user = SXTUser.shareUser()
                print(user)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

