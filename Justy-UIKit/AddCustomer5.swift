//
//  AddCustomer5.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/08.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class AddCustomer5: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()
        
        img.image = UIImage(systemName: "questionmark.circle.fill")
        img.tintColor = mainColor
    }
    
    func autoLayout(){
        img.translatesAutoresizingMaskIntoConstraints = false
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
}
