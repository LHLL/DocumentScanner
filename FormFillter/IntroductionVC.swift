//
//  IntroductionVC.swift
//  FormFillter
//
//  Created by Xu, Jay on 9/15/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class IntroductionVC: UIViewController {

    @IBOutlet weak var pages: UIPageControl!
    @IBOutlet weak var introList: iCarousel!
    @IBOutlet weak var disBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var current: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    fileprivate let titles = ["Scan any forms\nToss the paper",
                          "Find digital forms\nin a snap of fingers",
                          "Email digital forms\nfill up easier on large screen"
                          ]
    private var x:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introList.type = .rotary
        introList.isPagingEnabled = true
        disBtn.setImage(AssetManager.close, for: .normal)
        label.text = titles[0]
        current.text = "0 of 3"
        view.addGestureRecognizer(introList.panGesture)
    }
    
    @IBAction func dismissSelf(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension IntroductionVC:iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let cell = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 200))
        cell.clipsToBounds = true
        cell.contentMode = .scaleAspectFill
        cell.image = AssetManager.img
        return cell
    }
    
}

extension IntroductionVC:iCarouselDelegate {
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 3.5
        }
        return value
    }
    
    func carouselDidScroll(_ carousel: iCarousel) {
        pages.currentPage = carousel.currentItemIndex
        current.text = "\(carousel.currentItemIndex + 1) of 3"
        label.text = titles[carousel.currentItemIndex]
    }
}
