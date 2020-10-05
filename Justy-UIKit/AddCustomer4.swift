//
//  AddCustomer4.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/04.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class AddCustomer4: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    let screenHeight: CGFloat = UIScreen.main.bounds.size.height

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var micBtn: UIButton!
    @IBOutlet weak var textField_AttestedCopy: UITextField!
    @IBOutlet weak var Btn_AttestedCopy: UIButton!
    @IBOutlet weak var childInfo_txt1: UILabel!
    @IBOutlet weak var childInfo_boy: UITextField!
    @IBOutlet weak var childInfo_boy_txt: UILabel!
    @IBOutlet weak var childInfo_girl: UITextField!
    @IBOutlet weak var childInfo_girl_txt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()
        print(screenWidth)
        img.image = UIImage(systemName: "questionmark.circle.fill")
        img.tintColor = mainColor
        
        text1.text = "가족 관계에 대해 답변해 주세요."
        text1.textAlignment = .center
        text1.textColor = .black
        text1.font = UIFont.boldSystemFont(ofSize: 22)
        
        micBtn.setImage(UIImage.init(systemName: "mic.fill"), for: .normal)
        micBtn.tintColor = .black
        micBtn.setTitle("", for: .normal)
        micBtn.contentVerticalAlignment = .fill
        micBtn.contentHorizontalAlignment = .fill
        
        textField_AttestedCopy.isEnabled = false
        
        Btn_AttestedCopy.setTitle("", for: .normal)
        Btn_AttestedCopy.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        Btn_AttestedCopy.tintColor = .black
        Btn_AttestedCopy.contentVerticalAlignment = .fill
        Btn_AttestedCopy.contentHorizontalAlignment = .fill
        
        childInfo_txt1.text = "자식 정보 :"
        childInfo_txt1.textAlignment = .center
        childInfo_txt1.textColor = .black
        childInfo_txt1.backgroundColor = .yellow
        
        childInfo_boy_txt.text = "남"
        childInfo_boy_txt.textAlignment = .center
        childInfo_boy_txt.textColor = .black
        
        childInfo_girl_txt.text = "여"
        childInfo_girl_txt.textAlignment = .center
        childInfo_girl_txt.textColor = .black
    }
    
    func autoLayout(){
        img.translatesAutoresizingMaskIntoConstraints = false
        img.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 80).isActive = true
        img.heightAnchor.constraint(equalTo: img.widthAnchor).isActive = true
        
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 5).isActive = true
        text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text1.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        micBtn.translatesAutoresizingMaskIntoConstraints = false
        micBtn.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 15).isActive = true
        micBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        micBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        micBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        textField_AttestedCopy.translatesAutoresizingMaskIntoConstraints = false
        textField_AttestedCopy.topAnchor.constraint(equalTo: micBtn.bottomAnchor, constant: 50).isActive = true
        textField_AttestedCopy.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        textField_AttestedCopy.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        Btn_AttestedCopy.translatesAutoresizingMaskIntoConstraints = false
        Btn_AttestedCopy.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 70).isActive = true
        Btn_AttestedCopy.centerYAnchor.constraint(equalTo: textField_AttestedCopy.centerYAnchor).isActive = true
        Btn_AttestedCopy.widthAnchor.constraint(equalToConstant: 25).isActive = true
        Btn_AttestedCopy.heightAnchor.constraint(equalTo: Btn_AttestedCopy.widthAnchor).isActive = true
        
        childInfo_txt1.translatesAutoresizingMaskIntoConstraints = false
        childInfo_txt1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        childInfo_txt1.widthAnchor.constraint(equalToConstant: 80).isActive = true
        childInfo_txt1.topAnchor.constraint(equalTo: textField_AttestedCopy.bottomAnchor, constant: 20).isActive = true
    }
}
