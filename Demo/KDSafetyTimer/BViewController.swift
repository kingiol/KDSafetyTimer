//
//  BViewController.swift
//  KDSafetyTimer
//
//  Created by Kingiol on 2018/7/21.
//  Copyright © 2018 Kingiol. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Example 1
        timer = KDSafetyTimer.scheduledTimer(withTimeInterval: 1.0, target: self, selector: #selector(BViewController.timerAction(_:)), userInfo: nil, repeats: true)
        
        // Example 2
//        timer = KDSafetyTimer.scheduledTimer(withTimeInterval: 1.0, target: self, repeats: true, block: { (_) in
//            print("timer block")
//        })
        timer.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("BViewController deinit")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc private func timerAction(_ userInfo: Any?) {
        print("timerAction")
    }

}
