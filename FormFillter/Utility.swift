//
//  GenericVC.swift
//  FormFillter
//
//  Created by Xu, Jay on 9/15/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import Foundation
import AudioToolbox

struct Utility {
    
    private init(){}
    
    static var enableVibration = true
    
    static private var type:Bool {
        get{
            return vibrateType()
        }
    }
    
    static private func vibrateType()->Bool {
        if #available(iOS 10.0, *) {
            let deviceType = UIDevice.current.value(forKey: "_feedbackSupportLevel") as! Int
            return deviceType == 2
        }else{
            return false
        }
    }
    
    static func vibrate(){
        guard enableVibration else {return}
        if type {
            if #available(iOS 10.0, *) {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.prepare()
                generator.impactOccurred()
            } else {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            }
        }else{
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
}
