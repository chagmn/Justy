//
//  AddCustomer4.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/04.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

// 가족 관계 확인
class AddCustomer4: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    let picker = UIImagePickerController()

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var textField_AttestedCopy: UITextField!
    @IBOutlet weak var Btn_AttestedCopy: UIButton!
    @IBOutlet weak var childInfo_txt1: UILabel!
    @IBOutlet weak var childInfo_boy: UITextField!
    @IBOutlet weak var childInfo_boy_txt: UILabel!
    @IBOutlet weak var childInfo_girl: UITextField!
    @IBOutlet weak var childInfo_girl_txt: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()
        picker.delegate = self
       
        img.image = UIImage(systemName: "questionmark.circle.fill")
        img.tintColor = mainColor
        
        text1.text = "가족 관계에 대해 답변해 주세요."
        text1.textAlignment = .center
        text1.textColor = .black
        text1.font = UIFont.boldSystemFont(ofSize: 22)
        
        
        textField_AttestedCopy.isEnabled = false
        textField_AttestedCopy.insertText("등본 업로드")
        textField_AttestedCopy.textColor = .lightGray
        
        Btn_AttestedCopy.setTitle("", for: .normal)
        Btn_AttestedCopy.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        Btn_AttestedCopy.tintColor = .black
        Btn_AttestedCopy.contentVerticalAlignment = .fill
        Btn_AttestedCopy.contentHorizontalAlignment = .fill
        Btn_AttestedCopy.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(click_doneBtn))
        let flexiblespace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexiblespace, doneBtn]
        
        childInfo_txt1.text = "자식 정보 :"
        childInfo_txt1.textAlignment = .center
        childInfo_txt1.textColor = .black
        
        childInfo_boy.keyboardType = .numberPad
        childInfo_boy.textAlignment = .center
        childInfo_boy.inputAccessoryView = toolbar
            
        childInfo_boy_txt.text = "남"
        childInfo_boy_txt.textAlignment = .center
        childInfo_boy_txt.textColor = .black
        
        childInfo_girl.keyboardType = .numberPad
        childInfo_girl.textAlignment = .center
        childInfo_girl.inputAccessoryView = toolbar
        
        childInfo_girl_txt.text = "여"
        childInfo_girl_txt.textAlignment = .center
        childInfo_girl_txt.textColor = .black
        
        nextBtn.setTitle("next>", for: .normal)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 21.0)
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = mainColor
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.cornerRadius = 20
        nextBtn.clipsToBounds = true
        nextBtn.layer.borderColor = UIColor.clear.cgColor
        nextBtn.addTarget(self, action: #selector(nextview), for: .touchUpInside)
        
    }
    
    @objc func UploadFile(){
        let alert = UIAlertController(title: "사진 업로드", message: "원하는 방법을 선택하시오.", preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "사진앨범", style: .default){ (action) in self.openLibrary()
        }
        
        let camera = UIAlertAction(title: "카메라", style: .default){ (action) in
            self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
    }
    
    @objc func nextview(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer5"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func click_doneBtn(){
        view.endEditing(true)
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
        
        
        textField_AttestedCopy.translatesAutoresizingMaskIntoConstraints = false
        textField_AttestedCopy.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 150).isActive = true
        textField_AttestedCopy.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        textField_AttestedCopy.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        Btn_AttestedCopy.translatesAutoresizingMaskIntoConstraints = false
        Btn_AttestedCopy.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 70).isActive = true
        Btn_AttestedCopy.centerYAnchor.constraint(equalTo: textField_AttestedCopy.centerYAnchor).isActive = true
        Btn_AttestedCopy.widthAnchor.constraint(equalToConstant: 25).isActive = true
        Btn_AttestedCopy.heightAnchor.constraint(equalTo: Btn_AttestedCopy.widthAnchor).isActive = true
        
        childInfo_txt1.translatesAutoresizingMaskIntoConstraints = false
        childInfo_txt1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -40).isActive = true
        childInfo_txt1.widthAnchor.constraint(equalToConstant: 80).isActive = true
        childInfo_txt1.topAnchor.constraint(equalTo: textField_AttestedCopy.bottomAnchor, constant: 25).isActive = true
        
        childInfo_boy.translatesAutoresizingMaskIntoConstraints = false
        childInfo_boy.centerYAnchor.constraint(equalTo: childInfo_txt1.centerYAnchor).isActive = true
        childInfo_boy.leadingAnchor.constraint(equalTo: childInfo_txt1.trailingAnchor, constant: 15).isActive = true
        childInfo_boy.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        childInfo_boy_txt.translatesAutoresizingMaskIntoConstraints = false
        childInfo_boy_txt.centerYAnchor.constraint(equalTo: childInfo_txt1.centerYAnchor).isActive = true
        childInfo_boy_txt.leadingAnchor.constraint(equalTo:childInfo_boy.trailingAnchor, constant: 5).isActive = true
        
        childInfo_girl.translatesAutoresizingMaskIntoConstraints = false
        childInfo_girl.centerYAnchor.constraint(equalTo: childInfo_txt1.centerYAnchor).isActive = true
        childInfo_girl.leadingAnchor.constraint(equalTo: childInfo_boy_txt.trailingAnchor, constant: 15).isActive = true
        childInfo_girl.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        childInfo_girl_txt.translatesAutoresizingMaskIntoConstraints = false
        childInfo_girl_txt.centerYAnchor.constraint(equalTo: childInfo_txt1.centerYAnchor).isActive = true
        childInfo_girl_txt.leadingAnchor.constraint(equalTo:childInfo_girl.trailingAnchor, constant: 5).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
extension AddCustomer4:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
    }
    
}
