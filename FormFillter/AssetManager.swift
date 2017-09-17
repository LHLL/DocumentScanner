//
//  GenericVC.swift
//  FormFillter
//
//  Created by Xu, Jay on 9/15/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

struct AssetManager {
    
    private init(){}
    
    //Image/Icon
    static let search = IonIcons.image(withIcon: ion_ios_search,
                                       iconColor: .black,
                                       iconSize: 25,
                                       imageSize: CGSize(width: 25, height: 25))
    
    static let delete = IonIcons.image(withIcon: ion_trash_a,
                                       iconColor: .white,
                                       iconSize: 25,
                                       imageSize: CGSize(width: 25, height: 25))
    
    static let back = IonIcons.image(withIcon: ion_ios_arrow_left,
                                      iconColor: .white,
                                      iconSize: 30,
                                      imageSize: CGSize(width: 30, height: 30))
    
    static let power = IonIcons.image(withIcon: ion_power,
                                      iconColor: .white,
                                      iconSize: 25,
                                      imageSize: CGSize(width: 25, height: 25))
    
    static let img = IonIcons.image(withIcon: ion_clipboard,
                                    iconColor: .white,
                                    iconSize: 150,
                                    imageSize: CGSize(width: 150, height: 200))
    
    static let close = IonIcons.image(withIcon: ion_ios_close_empty,
                                      iconColor: .white,
                                      iconSize: 44,
                                      imageSize: CGSize(width: 44, height: 44))
    
    static let file = IonIcons.image(withIcon: ion_document_text,
                                     iconColor: .white,
                                     iconSize: 30,
                                     imageSize: CGSize(width: 30, height: 30))
    
    //Color
    static let gray = UIColor(colorLiteralRed: 183/255.0,
                              green: 183/255.0,
                              blue: 183/255.0,
                              alpha: 1)
    static let orange = UIColor(colorLiteralRed: 247/255.0,
                                green: 100/255.0,
                                blue: 60/255.0,
                                alpha: 1)
}
