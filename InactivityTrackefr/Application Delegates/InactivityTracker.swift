//
//  InactivityTracker.swift
//  InactivityTrackefr
//
//  Created by waheedCodes on 22/08/2023.
//

import UIKit

class InactivityTracker: UIApplication {
    
    // MARK: - Properties
    
    private var timeoutInSeconds: TimeInterval {
        return 2 * 60
    }
    
    private var idleTimer: Timer?
    
    // MARK: - Lifecycle
    
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        
        if idleTimer != nil {
            self.resetIdleTimer()
        }
        
        if let touches = event.allTouches {
            for touch in touches where touch.phase == UITouch.Phase.began {
                self.resetIdleTimer()
            }
        }
    }
    
    // MARK: - Events
    
    func resetIdleTimer() {
        if let idleTimer = idleTimer {
            idleTimer.invalidate()
        }
        
        idleTimer = Timer
            .scheduledTimer(
                timeInterval: timeoutInSeconds,
                target: self,
                selector: #selector(InactivityTracker.timeHasExceeded),
                userInfo: nil,
                repeats: false)
    }
    
    @objc private func timeHasExceeded() {
        NotificationCenter.default.post(name: .appTimeout, object: nil)
    }
}
