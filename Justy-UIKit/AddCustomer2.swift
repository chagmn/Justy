//
//  AddCustomer2.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/24.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class AddCustomer2: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerBirth: UILabel!
    @IBOutlet weak var customerPhone: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var birthField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var checkBox1: UIImageView!
    @IBOutlet weak var checkBox2: UIImageView!
    @IBOutlet weak var checkBox3: UIImageView!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    @IBOutlet weak var text4: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        img1.image = UIImage(systemName: "questionmark.circle.fill")
        img1.tintColor = mainColor
        
        text1.text = "회원 정보 입력"
        text1.font = UIFont.boldSystemFont(ofSize: 24.0)
        text1.textColor = .black
        text1.textAlignment = .center
        
        customerName.text = "이름"
        customerName.textColor = .black
        customerName.textAlignment = .center
        
        
        
        // AutoLayout Constranints
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text1.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: 5).isActive = true
        text1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        customerName.translatesAutoresizingMaskIntoConstraints = false
        customerName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 70).isActive = true
        customerName.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 30).isActive = true
        customerName.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
    }
}
