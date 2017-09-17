//
//  SettingCell.swift
//  FormFillter
//
//  Created by Xu, Jay on 9/15/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var ns: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ns.backgroundColor = ns.onTintColor
        ns.layer.cornerRadius = 16
        ns.layer.shadowColor = AssetManager.gray.cgColor
        ns.layer.shadowOpacity = 1
        ns.layer.shadowOffset = CGSize.zero
        ns.layer.shadowRadius = 10
        ns.layer.shadowPath = UIBezierPath(rect: CGRect(x: ns.bounds.origin.x+8,
                                                        y: ns.bounds.origin.y + 16,
                                                        width: 20,
                                                        height: 25)).cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ns.thumbTintColor = ns.isOn ? AssetManager.orange : AssetManager.gray
        if ns.isOn {
            ns.layer.shadowPath = UIBezierPath(rect: CGRect(x: ns.bounds.origin.x - 30 + ns.bounds.width,
                                                            y: ns.bounds.origin.y + 16,
                                                            width: 20,
                                                            height: 25)).cgPath
        }else{
            ns.layer.shadowPath = UIBezierPath(rect: CGRect(x: ns.bounds.origin.x+8,
                                                            y: ns.bounds.origin.y + 16,
                                                            width: 20,
                                                            height: 25)).cgPath
        }
    }
    
    @IBAction func shallWeSwitch(_ sender: UISwitch) {
        if titleLabel.text == "Scan&Found Vibration"{
            Utility.enableVibration = sender.isOn
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.thumbTintColor = sender.isOn ? AssetManager.orange : AssetManager.gray
            if sender.isOn {
                Utility.vibrate()
                sender.layer.shadowPath = UIBezierPath(rect: CGRect(x: sender.bounds.origin.x - 30 + sender.bounds.width,
                                                                    y: sender.bounds.origin.y + 16,
                                                                    width: 20,
                                                                    height: 25)).cgPath
            }else{
                sender.layer.shadowPath = UIBezierPath(rect: CGRect(x: sender.bounds.origin.x+8,
                                                                    y: sender.bounds.origin.y + 16,
                                                                    width: 20,
                                                                    height: 25)).cgPath
            }
        }
    }
}
