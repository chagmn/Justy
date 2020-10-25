//
//  AddCustomer5.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/08.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit
import PhotosUI

// 필요 서류 등록
@available(iOS 14, *)
class AddCustomer5: Common, PHPickerViewControllerDelegate{
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var addBtn1: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var addBtn2: UIButton!
    @IBOutlet weak var field3: UITextField!
    @IBOutlet weak var addBtn3: UIButton!
    @IBOutlet weak var field4: UITextField!
    @IBOutlet weak var addBtn4: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var name: String = ""
    var check_tag:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()
    
        self.config()
    }
    
    fileprivate func config(){
        img.image = UIImage(systemName: "questionmark.circle.fill")
        img.tintColor = mainColor
        
        text1.text = "필요한 서류를 등록해 주세요."
        text1.textAlignment = .center
        text1.textColor = .black
        text1.font = UIFont.boldSystemFont(ofSize: 22)
        
        field1.placeholder = "진단서 등록"
        field1.textAlignment = .center
        
        addBtn1.setTitle("", for: .normal)
        addBtn1.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        addBtn1.tintColor = .black
        addBtn1.contentVerticalAlignment = .fill
        addBtn1.contentHorizontalAlignment = .fill
        addBtn1.tag = 1
        addBtn1.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        field2.placeholder = "진술서 등록"
        field2.textAlignment = .center
        
        addBtn2.setTitle("", for: .normal)
        addBtn2.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        addBtn2.tintColor = .black
        addBtn2.contentVerticalAlignment = .fill
        addBtn2.contentHorizontalAlignment = .fill
        addBtn2.tag = 2
        addBtn2.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        field3.placeholder = "재외국민등록등본"
        field3.textAlignment = .center
        
        addBtn3.setTitle("", for: .normal)
        addBtn3.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        addBtn3.tintColor = .black
        addBtn3.contentVerticalAlignment = .fill
        addBtn3.contentHorizontalAlignment = .fill
        addBtn3.tag = 3
        addBtn3.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        field4.placeholder = "재감인 증명서"
        field4.textAlignment = .center
        
        addBtn4.setTitle("", for: .normal)
        addBtn4.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        addBtn4.tintColor = .black
        addBtn4.contentVerticalAlignment = .fill
        addBtn4.contentHorizontalAlignment = .fill
        addBtn4.tag = 4
        addBtn4.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        
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
    func openLibrary(tag: Int){
//        picker.sourceType = .photoLibrary
//        present(picker, animated: false, completion: nil)
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .any(of: [.images])
        
        let picker2 = PHPickerViewController(configuration: configuration)
        picker2.delegate = self
        self.present(picker2, animated: true,completion: nil)
        
        switch tag {
        case 1:
            self.field1.text = "업로드 완료"
            break
        case 2:
            self.field2.text = "업로드 완료"
            break
        case 3:
            self.field3.text = "업로드 완료"
            break
        case 4:
            self.field4.text = "업로드 완료"
            break
        default:
            print("실패")
        }
    }
    
    func openCamera(){
        picker.sourceType = .camera
        present(picker, animated: false, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        print("!!! Picker called !!!")
            
        picker.dismiss(animated: true)
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self){
            itemProvider.loadObject(ofClass: UIImage.self){ (image, error) in
                DispatchQueue.main.async {
                    let image: UIImage = (image as? UIImage)!
                    let imageData = image.jpegData(compressionQuality: 1.0)!
                    self.uploadImageToServer(a: imageData, name: self.name, tag: self.check_tag)
                }
            }
        }
    }
    
    // MARK: - Objc Methods
    @objc func nextview(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomerLast"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func backView(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer4"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func UploadFile(sender: UIButton!){
        let alert = UIAlertController(title: "사진 업로드", message: "원하는 방법을 선택하시오.", preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "사진앨범", style: .default){ (action) in
            self.openLibrary(tag: sender.tag)
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
        
        field1.translatesAutoresizingMaskIntoConstraints = false
        field1.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 100).isActive = true
        field1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        field1.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addBtn1.translatesAutoresizingMaskIntoConstraints = false
        addBtn1.centerYAnchor.constraint(equalTo: field1.centerYAnchor).isActive = true
        addBtn1.leadingAnchor.constraint(equalTo: field1.trailingAnchor, constant: 15).isActive = true
        addBtn1.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addBtn1.heightAnchor.constraint(equalTo: addBtn1.widthAnchor).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70).isActive = true
        nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        field2.translatesAutoresizingMaskIntoConstraints = false
        field2.topAnchor.constraint(equalTo: field1.bottomAnchor, constant: 25).isActive = true
        field2.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        field2.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addBtn2.translatesAutoresizingMaskIntoConstraints = false
        addBtn2.centerYAnchor.constraint(equalTo: field2.centerYAnchor).isActive = true
        addBtn2.leadingAnchor.constraint(equalTo: field2.trailingAnchor, constant: 15).isActive = true
        addBtn2.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addBtn2.heightAnchor.constraint(equalTo: addBtn2.widthAnchor).isActive = true
        
        field3.translatesAutoresizingMaskIntoConstraints = false
        field3.topAnchor.constraint(equalTo: field2.bottomAnchor, constant: 25).isActive = true
        field3.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        field3.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addBtn3.translatesAutoresizingMaskIntoConstraints = false
        addBtn3.centerYAnchor.constraint(equalTo: field3.centerYAnchor).isActive = true
        addBtn3.leadingAnchor.constraint(equalTo: field3.trailingAnchor, constant: 15).isActive = true
        addBtn3.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addBtn3.heightAnchor.constraint(equalTo: addBtn3.widthAnchor).isActive = true
        
        field4.translatesAutoresizingMaskIntoConstraints = false
        field4.topAnchor.constraint(equalTo: field3.bottomAnchor, constant: 25).isActive = true
        field4.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50).isActive = true
        field4.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        addBtn4.translatesAutoresizingMaskIntoConstraints = false
        addBtn4.centerYAnchor.constraint(equalTo: field4.centerYAnchor).isActive = true
        addBtn4.leadingAnchor.constraint(equalTo: field4.trailingAnchor, constant: 15).isActive = true
        addBtn4.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addBtn4.heightAnchor.constraint(equalTo: addBtn4.widthAnchor).isActive = true
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70).isActive = true
        backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

// MARK: - Extension
@available(iOS 14, *)
extension AddCustomer5: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
}
