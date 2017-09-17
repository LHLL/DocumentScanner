//
//  SettingCell.swift
//  FormFillter
//
//  Created by Xu, Jay on 9/15/17.
//  Copyright © 2017 Xu, Jay. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        icon.layer.cornerRadius = 22
        icon.image = AssetManager.file
    }
    
}
