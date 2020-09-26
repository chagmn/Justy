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
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var yearText: UILabel!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var monthText: UILabel!
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var dayText: UILabel!
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
        
        customerBirth.text = "생년월일"
        customerBirth.textColor = .black
        
        customerPhone.text = "전화번호"
        customerPhone.textColor = .black

        // 오토 레이아웃 함수 호출
        AutoConstraints()
    }
    
    // AutoLayout Constranints
    func AutoConstraints(){
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text1.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: 5).isActive = true
        text1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        customerName.translatesAutoresizingMaskIntoConstraints = false
        customerName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        customerName.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 30).isActive = true
        customerName.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        customerBirth.translatesAutoresizingMaskIntoConstraints = false
        customerBirth.leftAnchor.constraint(equalTo: customerName.leftAnchor).isActive = true
        customerBirth.topAnchor.constraint(equalTo: customerName.bottomAnchor, constant: 20).isActive = true
        customerBirth.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        customerPhone.translatesAutoresizingMaskIntoConstraints = false
        customerPhone.leftAnchor.constraint(equalTo: customerName.leftAnchor).isActive = true
        customerPhone.topAnchor.constraint(equalTo: customerBirth.bottomAnchor, constant: 20).isActive = true
        customerPhone.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.leftAnchor.constraint(equalTo: customerName.rightAnchor, constant: 5).isActive = true
        nameField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameField.centerYAnchor.constraint(equalTo: customerName.centerYAnchor).isActive = true
        
        yearField.translatesAutoresizingMaskIntoConstraints = false
        yearField.leftAnchor.constraint(equalTo: nameField.leftAnchor).isActive = true
        yearField.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        yearField.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        yearText.translatesAutoresizingMaskIntoConstraints = false
        yearText.leftAnchor.constraint(equalTo: yearField.rightAnchor, constant: 5).isActive = true
        yearText.centerYAnchor.constraint(equalTo: yearField.centerYAnchor).isActive = true
        
        monthField.translatesAutoresizingMaskIntoConstraints = false
        monthField.leftAnchor.constraint(equalTo: yearText.rightAnchor, constant: 10).isActive = true
        monthField.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        monthField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        monthText.translatesAutoresizingMaskIntoConstraints = false
        monthText.leftAnchor.constraint(equalTo: monthField.rightAnchor, constant: 5).isActive = true
        monthText.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        
        dayField.translatesAutoresizingMaskIntoConstraints = false
        dayField.leftAnchor.constraint(equalTo: monthText.rightAnchor, constant: 10).isActive = true
        dayField.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        dayField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        dayText.translatesAutoresizingMaskIntoConstraints = false
        dayText.leftAnchor.constraint(equalTo: dayField.rightAnchor, constant: 5).isActive = true
        dayText.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        phoneField.leftAnchor.constraint(equalTo: customerPhone.rightAnchor, constant: 5).isActive = true
        phoneField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        phoneField.centerYAnchor.constraint(equalTo: customerPhone.centerYAnchor).isActive = true
    }

}
