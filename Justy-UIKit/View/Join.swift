//
//  Join.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/08/19.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class Join: Common, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet weak var label_ID: UILabel!
    @IBOutlet weak var label_PW: UILabel!
    @IBOutlet weak var label_Name: UILabel!
    @IBOutlet weak var label_Type: UILabel!
    @IBOutlet weak var textbox_ID: UITextField!
    @IBOutlet weak var textbox_PW: UITextField!
    @IBOutlet weak var textbox_Name: UITextField!
    @IBOutlet weak var navigation_bar: UINavigationBar!
    @IBOutlet weak var textbox_type: UITextField!
    @IBOutlet weak var btn_Join: UIButton!
    let joinType = ["변호사", "일반 회원(준바중)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light 
 
        self.config()
    }
    

    func config(){
        navigation_bar.topItem?.title = "회원가입"


        navigation_bar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigation_bar.isTranslucent = false
        navigation_bar.setBackgroundImage(UIImage(), for: .default)
        navigation_bar.shadowImage = UIImage()
        
        label_ID.text = "아이디"
        label_PW.text = "비밀번호"
        label_Name.text = "성함"
        label_Type.text = "가입 유형"
        
        textbox_PW.isSecureTextEntry = true
        textbox_ID.delegate = self
        textbox_PW.delegate = self
        textbox_Name.delegate = self
        
        textbox_type.text = "변호사"
        createPickerView()
        dismissPickerView()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    // MARK: - function Methods
    // 하나의 pickerView 에서 선택 가능한 몇개를 보여줄 것 인지?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return joinType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return joinType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textbox_type.text = joinType[row]
    }
    
    func createPickerView(){
        let pickerview = UIPickerView()
        pickerview.delegate = self
        textbox_type.inputView = pickerview
    }
    
    func dismissPickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        var items: [UIBarButtonItem] = []
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let button = UIBarButtonItem(title: "선택", style: .plain, target: self, action: #selector(self.action))
        items.append(flexibleSpace)
        items.append(button)
        
        toolBar.setItems(items, animated: true)
        toolBar.isUserInteractionEnabled = true
        textbox_type.inputAccessoryView = toolBar
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - objc Methods
    @objc func action(){
        self.view.endEditing(true)
    }
    
    
    // return 버튼 누르면 다시 제자리
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }

    // MARK: - IBAction methods
    @IBAction func joinBtn(){
        
        if (textbox_ID.text?.isEmpty ?? true) && (textbox_PW.text?.isEmpty ?? true) && (textbox_Name.text?.isEmpty ?? true) && (textbox_Name.text?.isEmpty ?? true){
            let fail_alert = UIAlertController(title: nil, message: "정보를 다 입력해주세요.", preferredStyle: .alert)
            
            fail_alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))

            present(fail_alert, animated: false, completion: nil)
            
        } else {
            let success_alert = UIAlertController(title: nil, message: "회원가입이 완료되었습니다.", preferredStyle: .alert)
            
            success_alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "LoginView"){
                    controller.modalPresentationStyle = .fullScreen
                    controller.modalTransitionStyle = .coverVertical

                    self.present(controller, animated: true, completion: nil)
                }
            }))
            
            present(success_alert, animated: false, completion: nil)
        }
    }
}
