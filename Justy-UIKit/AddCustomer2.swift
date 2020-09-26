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
    var checkState1 = false
    var checkState2 = false
    var checkState3 = false
    
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
        
        checkBox1.image = UIImage(systemName: "square")
        checkBox1.tintColor = .black
        
        checkBox2.image = UIImage(systemName: "square")
        checkBox2.tintColor = .black
        
        checkBox3.image = UIImage(systemName: "square")
        checkBox3.tintColor = .black
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(checkclick3(_:)))
                                            
        text2.text = "초혼"
        text2.textColor = .black
        text2.isUserInteractionEnabled = true
        text2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkclick1(_:))))
        
        text3.text = "재혼"
        text3.textColor = .black
        text3.isUserInteractionEnabled = true
        text3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkclick2(_:))))
        
        text4.text = "이혼 경험"
        text4.textColor = .black
        text4.isUserInteractionEnabled = true
        text4.addGestureRecognizer(gesture)
        
        nextBtn.setTitle("next>", for: .normal)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 21.0)
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = mainColor
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.cornerRadius = 20
        nextBtn.clipsToBounds = true
        nextBtn.layer.borderColor = UIColor.clear.cgColor
        nextBtn.addTarget(self, action: #selector(nextview), for: .touchUpInside)
        
        // 오토 레이아웃 함수 호출
        AutoConstraints()
    }
    
    @objc func nextview(){
        
    }
    
    @objc func checkclick1(_ sender: UITapGestureRecognizer){
        if !checkState1{
            checkBox1.image = UIImage(systemName: "checkmark.square")
            checkState1 = true
        }else {
            checkBox1.image = UIImage(systemName: "square")
            checkState1 = false
        }
    }
    
    @objc func checkclick2(_ sender: UITapGestureRecognizer){
        if !checkState2{
            checkBox2.image = UIImage(systemName: "checkmark.square")
            checkState2 = true
        }else {
            checkBox2.image = UIImage(systemName: "square")
            checkState2 = false
        }
    }
    
    @objc func checkclick3(_ sender: UITapGestureRecognizer){
        if !checkState3{
            checkBox3.image = UIImage(systemName: "checkmark.square")
            checkState3 = true
        }else {
            checkBox3.image = UIImage(systemName: "square")
            checkState3 = false
        }
    }
    
    // AutoLayout Constranints
    func AutoConstraints(){
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text1.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: 5).isActive = true
        text1.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        customerName.translatesAutoresizingMaskIntoConstraints = false
        customerName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        customerName.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 50).isActive = true
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
        
        checkBox1.translatesAutoresizingMaskIntoConstraints = false
        checkBox1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        checkBox1.topAnchor.constraint(equalTo: customerPhone.bottomAnchor, constant: 50).isActive = true
        checkBox1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBox1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        checkBox2.translatesAutoresizingMaskIntoConstraints = false
        checkBox2.leftAnchor.constraint(equalTo: checkBox1.leftAnchor).isActive = true
        checkBox2.topAnchor.constraint(equalTo: checkBox1.bottomAnchor, constant: 10).isActive = true
        checkBox2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBox2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        checkBox3.translatesAutoresizingMaskIntoConstraints = false
        checkBox3.leftAnchor.constraint(equalTo: checkBox1.leftAnchor).isActive = true
        checkBox3.topAnchor.constraint(equalTo: checkBox2.bottomAnchor, constant: 10).isActive = true
        checkBox3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBox3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        text2.translatesAutoresizingMaskIntoConstraints = false
        text2.leftAnchor.constraint(equalTo: checkBox1.rightAnchor, constant: 30).isActive = true
        text2.centerYAnchor.constraint(equalTo: checkBox1.centerYAnchor).isActive = true
        
        text3.translatesAutoresizingMaskIntoConstraints = false
        text3.leftAnchor.constraint(equalTo: text2.leftAnchor).isActive = true
        text3.centerYAnchor.constraint(equalTo: checkBox2.centerYAnchor).isActive = true
        
        text4.translatesAutoresizingMaskIntoConstraints = false
        text4.leftAnchor.constraint(equalTo: text3.leftAnchor).isActive = true
        text4.centerYAnchor.constraint(equalTo: checkBox3.centerYAnchor).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextBtn.topAnchor.constraint(equalTo: text4.bottomAnchor, constant: 60).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
