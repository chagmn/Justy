//
//  AddCustomer3.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/26.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class AddCustomer3: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        
        img.image = UIImage(systemName: "questionmark.circle.fill")
        img.tintColor = mainColor
        
        text.font = UIFont.boldSystemFont(ofSize: 24)
        text.text = "이혼하는 이유를 서술해주세요."
        text.textColor = .black
        
        
        autoLayout()
    }
    
    func autoLayout(){
        view.translatesAutoresizingMaskIntoConstraints = true
        img.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 120).isActive = true
        img.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        text.translatesAutoresizingMaskIntoConstraints = true
        text.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 5).isActive = true
        text.widthAnchor.constraint(equalToConstant: 180).isActive = true
        text.heightAnchor.constraint(equalToConstant: 40).isActive = true
        text.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
    }
}
