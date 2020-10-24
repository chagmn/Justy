//
//  AddCustomer3.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/26.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

// 이혼하는 이유
class AddCustomer3: Common{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var micBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var textfield: UITextView!
    @IBOutlet weak var backBtn: UIButton!
    
    var name: String = ""
    var birth: String = ""
    var phone: String = ""
    var firstmarriage: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()
        
        self.config()
    }
    
    fileprivate func config(){
        img.image = UIImage(systemName: "questionmark.circle.fill")
        img.tintColor = mainColor
        
        text1.font = UIFont.boldSystemFont(ofSize: 22)
        text1.text = "이혼하는 이유를 서술해주세요."
        text1.textColor = .black
        text1.textAlignment = .center
        
        micBtn.setImage(UIImage.init(systemName: "mic.fill"), for: .normal)
        micBtn.tintColor = .black
        micBtn.setTitle("", for: .normal)
        micBtn.contentVerticalAlignment = .fill
        micBtn.contentHorizontalAlignment = .fill
        
        textfield.text = "내용을 입력해주세요."
        textfield.textAlignment = .left
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.delegate = self
  
        
        nextBtn.setTitle("next>", for: .normal)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 21.0)
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = mainColor
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.cornerRadius = 20
        nextBtn.clipsToBounds = true
        nextBtn.layer.borderColor = UIColor.clear.cgColor
        nextBtn.addTarget(self, action: #selector(nextview), for: .touchUpInside)
        
        backBtn.setTitle("<back", for: .normal)
        backBtn.titleLabel?.font = UIFont.systemFont(ofSize: 21.0)
        backBtn.tintColor = .white
        backBtn.backgroundColor = mainColor
        backBtn.layer.borderWidth = 1
        backBtn.layer.cornerRadius = 20
        backBtn.clipsToBounds = true
        backBtn.layer.borderColor = UIColor.clear.cgColor
        backBtn.addTarget(self, action: #selector(backView), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - objc Methods
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    @objc func backView(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer2"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func nextview(){
        if #available(iOS 14, *) {
            if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer4") as? AddCustomer4 {
                
                controller.name = name
                controller.birth = birth
                controller.phone = phone
                controller.reason = textfield.text!
                controller.firstmarriage = firstmarriage
                    
                controller.modalPresentationStyle = .currentContext
                print("정보 :: \(name), \(birth), \(phone), \(firstmarriage), \(textfield.text!)")
                self.present(controller, animated: false, completion: nil)
                
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    // MARK: - AutoLayout
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
        micBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        micBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.topAnchor.constraint(equalTo: micBtn.bottomAnchor, constant: 15).isActive = true
        textfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        textfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        textfield.bottomAnchor.constraint(equalTo: nextBtn.topAnchor, constant: -25).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70).isActive = true
        backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
    }
}

// MARK: - Extension
extension AddCustomer3: UITextViewDelegate{
    func placeHolderSetting(){
        if textfield.text == "내용을 입력해주세요."{
            textfield.text = ""
            textfield.textColor = .black
        }else if textfield.text == ""{
            textfield.text = "내용을 입력해주세요."
            textfield.textColor = .lightGray
        }
    }
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textfield.text = textfield.text + "\n"
            //textfield.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeHolderSetting()
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textfield.text == "" {
            placeHolderSetting()
        }
    }
}
