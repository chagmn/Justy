//
//  AddCustomer4.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/04.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

// 가족 관계 확인 
class AddCustomer4: Common{
    
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
    @IBOutlet weak var evi2Field: UITextField!
    @IBOutlet weak var evi2Btn: UIButton!
    @IBOutlet weak var evi3Field: UITextField!
    @IBOutlet weak var evi3Btn: UIButton!
    @IBOutlet weak var evi4Field: UITextField!
    @IBOutlet weak var evi4Btn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()

        self.config()
    }
    
    func config(){
        picker.delegate = self
       
        img.image = UIImage(systemName: "questionmark.circle.fill")
        img.tintColor = mainColor
        
        text1.text = "가족 관계에 대해 답변해 주세요."
        text1.textAlignment = .center
        text1.textColor = .black
        text1.font = UIFont.boldSystemFont(ofSize: 22)
        
        
        textField_AttestedCopy.isEnabled = false
        textField_AttestedCopy.placeholder = "등본 업로드"
        textField_AttestedCopy.textAlignment = .center
        
        Btn_AttestedCopy.setTitle("", for: .normal)
        Btn_AttestedCopy.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        Btn_AttestedCopy.tintColor = .black
        Btn_AttestedCopy.contentVerticalAlignment = .fill
        Btn_AttestedCopy.contentHorizontalAlignment = .fill
        Btn_AttestedCopy.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        evi2Field.isEnabled = false
        evi2Field.placeholder = "가족관계증명서 업로드"
        evi2Field.textAlignment = .center
        
        evi2Btn.setTitle("", for: .normal)
        evi2Btn.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        evi2Btn.tintColor = .black
        evi2Btn.contentVerticalAlignment = .fill
        evi2Btn.contentHorizontalAlignment = .fill
        evi2Btn.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
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
        
        evi3Field.isEnabled = false
        evi3Field.placeholder = "양육,친권자 협의서 업로드"
        evi3Field.textAlignment = .center
        
        evi3Btn.setTitle("", for: .normal)
        evi3Btn.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        evi3Btn.tintColor = .black
        evi3Btn.contentVerticalAlignment = .fill
        evi3Btn.contentHorizontalAlignment = .fill
        evi3Btn.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        evi4Field.isEnabled = false
        evi4Field.placeholder = "가정법원 심판정본 업로드"
        evi4Field.textAlignment = .center
        
        evi4Btn.setTitle("", for: .normal)
        evi4Btn.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        evi4Btn.tintColor = .black
        evi4Btn.contentVerticalAlignment = .fill
        evi4Btn.contentHorizontalAlignment = .fill
        evi4Btn.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
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
    }

    // MARK: - Methods
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    func openCamera(){
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
    }
    
    // MARK: - Objc Methods
    @objc func nextview(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer5"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func backView(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer3"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func click_doneBtn(){
        view.endEditing(true)
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
    
    // MARK: - AutoLayout
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
        textField_AttestedCopy.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 100).isActive = true
        textField_AttestedCopy.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        textField_AttestedCopy.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        Btn_AttestedCopy.translatesAutoresizingMaskIntoConstraints = false
        Btn_AttestedCopy.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 100).isActive = true
        Btn_AttestedCopy.centerYAnchor.constraint(equalTo: textField_AttestedCopy.centerYAnchor).isActive = true
        Btn_AttestedCopy.widthAnchor.constraint(equalToConstant: 25).isActive = true
        Btn_AttestedCopy.heightAnchor.constraint(equalTo: Btn_AttestedCopy.widthAnchor).isActive = true
        
        evi2Field.translatesAutoresizingMaskIntoConstraints = false
        evi2Field.topAnchor.constraint(equalTo: textField_AttestedCopy.bottomAnchor, constant: 10).isActive = true
        evi2Field.trailingAnchor.constraint(equalTo: textField_AttestedCopy.trailingAnchor).isActive = true
        evi2Field.widthAnchor.constraint(equalTo: textField_AttestedCopy.widthAnchor).isActive = true
        
        evi2Btn.translatesAutoresizingMaskIntoConstraints = false
        evi2Btn.leadingAnchor.constraint(equalTo: Btn_AttestedCopy.leadingAnchor).isActive = true
        evi2Btn.centerYAnchor.constraint(equalTo: evi2Field.centerYAnchor).isActive = true
        evi2Btn.widthAnchor.constraint(equalTo: Btn_AttestedCopy.widthAnchor).isActive = true
        evi2Btn.heightAnchor.constraint(equalTo: evi2Btn.widthAnchor).isActive = true
        
        childInfo_txt1.translatesAutoresizingMaskIntoConstraints = false
        childInfo_txt1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -40).isActive = true
        childInfo_txt1.widthAnchor.constraint(equalToConstant: 80).isActive = true
        childInfo_txt1.topAnchor.constraint(equalTo: evi2Field.bottomAnchor, constant: 30).isActive = true
        
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
        
        evi3Field.translatesAutoresizingMaskIntoConstraints = false
        evi3Field.topAnchor.constraint(equalTo: childInfo_txt1.bottomAnchor, constant: 30).isActive = true
        evi3Field.trailingAnchor.constraint(equalTo: textField_AttestedCopy.trailingAnchor).isActive = true
        evi3Field.widthAnchor.constraint(equalTo: textField_AttestedCopy.widthAnchor).isActive = true
        
        evi3Btn.translatesAutoresizingMaskIntoConstraints = false
        evi3Btn.leadingAnchor.constraint(equalTo: Btn_AttestedCopy.leadingAnchor).isActive = true
        evi3Btn.centerYAnchor.constraint(equalTo: evi3Field.centerYAnchor).isActive = true
        evi3Btn.widthAnchor.constraint(equalTo: Btn_AttestedCopy.widthAnchor).isActive = true
        evi3Btn.heightAnchor.constraint(equalTo: evi3Btn.widthAnchor).isActive = true
        
        evi4Field.translatesAutoresizingMaskIntoConstraints = false
        evi4Field.topAnchor.constraint(equalTo: evi3Field.bottomAnchor, constant: 10).isActive = true
        evi4Field.trailingAnchor.constraint(equalTo: textField_AttestedCopy.trailingAnchor).isActive = true
        evi4Field.widthAnchor.constraint(equalTo: textField_AttestedCopy.widthAnchor).isActive = true
        
        evi4Btn.translatesAutoresizingMaskIntoConstraints = false
        evi4Btn.leadingAnchor.constraint(equalTo: Btn_AttestedCopy.leadingAnchor).isActive = true
        evi4Btn.centerYAnchor.constraint(equalTo: evi4Field.centerYAnchor).isActive = true
        evi4Btn.widthAnchor.constraint(equalTo: Btn_AttestedCopy.widthAnchor).isActive = true
        evi4Btn.heightAnchor.constraint(equalTo: evi4Btn.widthAnchor).isActive = true
        
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
extension AddCustomer4:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
    }
    
}
