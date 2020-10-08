//
//  AddCustomer3.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/26.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

// 이혼하는 이유
class AddCustomer3: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var micBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var textfield: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()
        
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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func nextview(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer4"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
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
        micBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        micBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
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
