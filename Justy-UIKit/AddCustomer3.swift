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
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var micBtn: UIButton!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light

        
        img.image = UIImage(systemName: "questionmark.circle.fill")
        img.tintColor = mainColor
        
        text1.font = UIFont.boldSystemFont(ofSize: 22)
        text1.text = "이혼하는 이유를 서술해주세요."
        text1.textColor = .black
        text1.textAlignment = .center
        
        micBtn.setImage(UIImage.init(systemName: "mic.fill"), for: .normal)
        micBtn.tintColor = .black
        micBtn.setTitle("", for: .normal)
        micBtn.clipsToBounds = true
        micBtn.contentMode = .scaleToFill
        
        textfield.text = "내용을 입력해주세요."
        textfield.textAlignment = .left
        textfield.contentVerticalAlignment = .top
        
        nextBtn.setTitle("next>", for: .normal)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 21.0)
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = mainColor
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.cornerRadius = 20
        nextBtn.clipsToBounds = true
        nextBtn.layer.borderColor = UIColor.clear.cgColor
        nextBtn.addTarget(self, action: #selector(nextview), for: .touchUpInside)
        
        
        autoLayout()
    }
    
    @objc func nextview(){
        
    }
    
    func autoLayout(){
        img.translatesAutoresizingMaskIntoConstraints = false
        img.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.widthAnchor.constraint(equalToConstant: 80).isActive = true
        img.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 5).isActive = true
        text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text1.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        micBtn.translatesAutoresizingMaskIntoConstraints = false
        micBtn.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 15).isActive = true
        micBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        micBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        micBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.topAnchor.constraint(equalTo: micBtn.bottomAnchor, constant: 15).isActive = true
        textfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        textfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        textfield.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -25).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
    }
}
