//
//  Login.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/08/18.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class Login: Common, UITextFieldDelegate {

    @IBOutlet weak var label_id: UILabel!
    @IBOutlet weak var label_pw: UILabel!
    @IBOutlet weak var textbox_ID: UITextField!
    @IBOutlet weak var textbox_PW: UITextField!
    
    let admin_ID: String = "1"
    let admin_PW: String = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        self.config()
    }
    
    fileprivate func config(){
        label_id.text = "아이디"
        label_id.textAlignment = .center
        
        label_pw.text = "비밀번호"
        label_pw.textAlignment = .center
        
        // 로그인 부분 삭제하기 나중에
        textbox_ID.text = "1"
        textbox_PW.text = "1"
        
        textbox_PW.isSecureTextEntry = true
        self.textbox_ID.delegate = self
        self.textbox_PW.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - objc Methods
    // 화면을 키보드가 가리지않게 올리기
    @objc func keyboardWillShow(_ sender: Notification) {
         self.view.frame.origin.y = -150
    }
    
    // return 버튼 누르면 다시 제자리
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    // MARK: - IBAction methods
    // ID, PW 확인 후 로그인
    @IBAction func check_Login(_ sender: Any) {
        if ((textbox_ID.text == admin_ID) && (textbox_PW.text == admin_PW)) {
            
            let alert = UIAlertController(title: nil, message: "로그인 되었습니다.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
                if let controller = self.storyboard?.instantiateViewController(withIdentifier: "myPageView"){
                    controller.modalPresentationStyle = .fullScreen
                    controller.modalTransitionStyle = .coverVertical

                    self.present(controller, animated: true, completion: nil)
                }
            }))
            
            present(alert, animated: false, completion: nil)
        } else {
            let alert = UIAlertController(title: nil, message: "다시 입력해주세요.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            
            present(alert, animated: false, completion: nil)
        }
        
    }
}
