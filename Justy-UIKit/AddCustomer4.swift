//
//  AddCustomer4.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/04.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class AddCustomer4: UIViewController{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var micBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()
        
    }
    
    func autoLayout(){
        img.translatesAutoresizingMaskIntoConstraints = false
        img.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 80).isActive = true
        img.heightAnchor.constraint(equalTo: img.widthAnchor).isActive = true
        
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 5).isActive = true
        text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        micBtn.translatesAutoresizingMaskIntoConstraints = false
        micBtn.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 5).isActive = true
        micBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        micBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        micBtn.heightAnchor.constraint(equalTo: micBtn.widthAnchor).isActive = true
    }
}
