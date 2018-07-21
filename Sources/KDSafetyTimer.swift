//
//  KDSafetyTimer.swift
//  KDSafetyTimer
//
//  Created by Kingiol on 2018/7/21.
//  Copyright © 2018 Kingiol. All rights reserved.
//

import Foundation

class KDSafetyTimer {
    
    weak private var target: AnyObject!
    weak private(set) var timer: Timer!
    private var selector: Selector?
    private var block: ((Timer) -> Void)?
    
    class func scheduledTimer(withTimeInterval interval: TimeInterval, target: AnyObject, selector: Selector, userInfo: Any?, repeats: Bool) -> Timer {
        let safetyTimer = KDSafetyTimer()
        safetyTimer.target = target
        safetyTimer.selector = selector
        safetyTimer.timer = Timer.scheduledTimer(timeInterval: interval, target: safetyTimer, selector: #selector(KDSafetyTimer.fireWithTimer(_:)), userInfo: userInfo, repeats: repeats)
        return safetyTimer.timer
    }
    
    class func scheduledTimer(withTimeInterval interval: TimeInterval, target: AnyObject, repeats: Bool, block: @escaping (Timer) -> Void) -> Timer {
        let safetyTimer = KDSafetyTimer()
        safetyTimer.target = target
        safetyTimer.block = block
        safetyTimer.timer = Timer.scheduledTimer(timeInterval: interval, target: safetyTimer, selector: #selector(KDSafetyTimer.fireWithTimer(_:)), userInfo: nil, repeats: repeats)
        return safetyTimer.timer
    }
    
    @objc private func fireWithTimer(_ timer: Timer) {
        if self.target != nil {
            if let _selector = self.selector {
                _ = self.target.perform(_selector, with: timer.userInfo)
            } else if let _block =  self.block {
                _block(timer)
            }
        } else if self.timer != nil {
            self.timer.invalidate()
        }
    }
    
//    deinit {
//        print("KDSafetyTimer deinit")
//    }
    
}
