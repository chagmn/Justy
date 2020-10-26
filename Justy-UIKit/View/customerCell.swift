//
//  customerCell.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/21.
//  Copyright © 2020 창민. All rights reserved.
//

import Foundation
import UIKit

class customerCell:  UITableViewCell {
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    @IBOutlet weak var customerImg: UIImageView!
    @IBOutlet weak var customerProgress: UIProgressView!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerInfoBtn: UIButton!
    var customerReason: String = ""
    var customerJudgement: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customerImg.image = UIImage(systemName: "person")
        customerImg.tintColor = .white
        customerImg.backgroundColor = .gray
        
        customerProgress.tintColor = mainColor
        
        customerInfoBtn.tintColor = .black
    }
}
