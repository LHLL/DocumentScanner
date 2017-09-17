//
//  ViewController.swift
//  FormFillter
//
//  Created by Xu, Jay on 9/12/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signView: UIView!
    var identity = CGAffineTransform.identity
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .began:
            identity = signView.transform
        case .ended,.changed:
            signView.transform = identity.scaledBy(x: sender.scale, y: sender.scale)
        default:
            break
        }
    }
    
    @IBAction func rotate(_ sender: UIRotationGestureRecognizer) {
        //signView.transform = signView.transform.rotated(by: sender.rotation)
        switch sender.state {
        case .began:
            identity = signView.transform
        case .ended,.changed:
            signView.transform = identity.rotated(by: sender.rotation)
        default:
            break
        }
    }
}

