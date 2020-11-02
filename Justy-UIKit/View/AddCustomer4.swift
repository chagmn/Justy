//
//  AddCustomer4.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/04.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import PhotosUI

// 가족 관계 확인
@available(iOS 14, *)
class AddCustomer4: Common, PHPickerViewControllerDelegate{
    
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
    @IBOutlet weak var insertBtn: UIButton!
    
    var name: String = ""
    var birth: String = ""
    var phone: String = ""
    var reason: String = ""
    var firstmarriage:Bool = false
    var child = ""
    var check_tag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()

        self.config()
    }
    
    fileprivate func config(){
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
        Btn_AttestedCopy.tag = 1
        Btn_AttestedCopy.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        evi2Field.isEnabled = false
        evi2Field.placeholder = "가족관계증명서 업로드"
        evi2Field.textAlignment = .center
        
        evi2Btn.setTitle("", for: .normal)
        evi2Btn.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        evi2Btn.tintColor = .black
        evi2Btn.contentVerticalAlignment = .fill
        evi2Btn.contentHorizontalAlignment = .fill
        evi2Btn.tag = 2
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
        evi3Btn.tag = 3
        evi3Btn.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        evi4Field.isEnabled = false
        evi4Field.placeholder = "가정법원 심판정본 업로드"
        evi4Field.textAlignment = .center
        
        evi4Btn.setTitle("", for: .normal)
        evi4Btn.setImage(UIImage(systemName: "tray.and.arrow.up.fill"), for: .normal)
        evi4Btn.tintColor = .black
        evi4Btn.contentVerticalAlignment = .fill
        evi4Btn.contentHorizontalAlignment = .fill
        evi4Btn.tag = 4
        evi4Btn.addTarget(self, action: #selector(UploadFile), for: .touchUpInside)
        
        
        insertBtn.setTitle("입력", for: .normal)
        insertBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        insertBtn.tintColor = .white
        insertBtn.backgroundColor = mainColor
        insertBtn.layer.borderWidth = 1
        insertBtn.layer.cornerRadius = 15
        insertBtn.clipsToBounds = true
        insertBtn.layer.borderColor = UIColor.clear.cgColor
        insertBtn.addTarget(self, action: #selector(putData), for: .touchUpInside)
        
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
    @available(iOS 14, *)
    func openLibrary(tag: Int){
//        picker.sourceType = .photoLibrary
//        present(picker, animated: false, completion: nil)
        
        print("!!! openLibrary called !!!")
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .any(of: [.images])
        
        switch tag {
        case 1:
            self.check_tag = 1
            self.textField_AttestedCopy.text = "등본 업로드 완료"
            break
        case 2:
            self.check_tag = 2
            self.evi2Field.text = "가족관계증명서 업로드 완료"
            break
        case 3:
            self.check_tag = 3
            self.evi3Field.text = "협의서 업로드 완료"
            break
        case 4:
            self.check_tag = 4
            self.evi4Field.text = "심판 정본 업로드 완료"
            break
        default:
            self.check_tag = 0
            print("실패")
        }
        
        let picker2 = PHPickerViewController(configuration: configuration)
        picker2.delegate = self
        self.present(picker2, animated: true,completion: nil)
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
                DispatchQueue.main.async { [self] in
                    let image: UIImage = (image as? UIImage)!
                    let imageData = image.jpegData(compressionQuality: 1.0)!
                    self.uploadImageToServer(a: imageData, name: name, tag: check_tag)
                }
            }
        }
    }
    
    // 정보 전달
    func PostInfo(){
        print("PostInfo() called")
        
        let params: [String: Any] = [
            "name": self.name,
            "birth": self.birth,
            "phone": self.phone,
            "firstmarriage": self.firstmarriage,
            "reason": self.reason,
            "child": self.child,
            "evi1": "",
            "evi2": "",
            "evi3": "",
            "evi4": "",
            "evi5": "",
            "evi6": "",
            "evi7": "",
            "evi8": "",
            "judgement" : "",
        ]
        
        AF.request("http://127.0.0.1:3000/users", method: .post, parameters: params, encoding: URLEncoding.default)
            .responseJSON(completionHandler: { response in
                debugPrint("PostInfo response : \(response)")
            })
        
    }
    
 

    // MARK: - Objc Methods
    @objc func putData(){
        child = childInfo_boy.text! + "남" + childInfo_girl.text! + "여"
        self.PostInfo()
    }
    
    @objc func nextview(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer5") as? AddCustomer5{
            
            putEvidence()

            controller.name = self.name
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
    
    @objc func UploadFile(sender: UIButton!){
        print("!!! UploadFile called !!!")

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
        
        
        textField_AttestedCopy.translatesAutoresizingMaskIntoConstraints = false
        textField_AttestedCopy.topAnchor.constraint(equalTo: childInfo_boy.bottomAnchor, constant: 80).isActive = true
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
        childInfo_txt1.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 80).isActive = true
        
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
        
        insertBtn.translatesAutoresizingMaskIntoConstraints = false
        insertBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        insertBtn.topAnchor.constraint(equalTo: childInfo_boy.bottomAnchor, constant: 20).isActive = true
        insertBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        insertBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        evi3Field.translatesAutoresizingMaskIntoConstraints = false
        evi3Field.topAnchor.constraint(equalTo: evi2Field.bottomAnchor, constant: 30).isActive = true
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
@available(iOS 14, *)
extension AddCustomer4: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        print(info)
//        let url: NSURL  = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.imageURL.rawValue)] as! NSURL
//        print("AddCustomer4: \(url)")
//
//        do{
//
//            let imageData = try Data(contentsOf: url as URL)
//            uploadImageToServer(a: imageData)
//        }catch{
//            print("NSURL Fucking")
//        }
//    }
}
