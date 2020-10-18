//
//  AddCustomer2.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/24.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

// 고객 기본 정보
class AddCustomer2: Common{
    
    let year: [Int] = Array(1950...2020)
    let month: [Int] = Array(1...12)
    let day: [Int] = Array(1...31)
    var checkState1 = false
    var checkState2 = false
    var checkState3 = false
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var customerBirth: UILabel!
    @IBOutlet weak var customerPhone: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var yearText: UILabel!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var monthText: UILabel!
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var dayText: UILabel!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var checkBox1: UIImageView!
    @IBOutlet weak var checkBox2: UIImageView!
    @IBOutlet weak var checkBox3: UIImageView!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    @IBOutlet weak var text4: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        config()
        createPickerViews()
        dismissPickerView()
        AutoConstraints()
    }
    
    fileprivate func config(){
        img1.image = UIImage(systemName: "questionmark.circle.fill")
        img1.tintColor = mainColor
        
        text1.text = "회원 정보 입력"
        text1.font = UIFont.boldSystemFont(ofSize: 24.0)
        text1.textColor = .black
        text1.textAlignment = .center
        
        customerName.text = "이름"
        customerName.textColor = .black
        customerName.textAlignment = .center
        
        customerBirth.text = "생년월일"
        customerBirth.textColor = .black
        
        customerPhone.text = "전화번호"
        customerPhone.textColor = .black
        
        nameField.delegate = self
        nameField.tag = 1
       
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(click_doneBtn))
        let flexiblespace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexiblespace, doneBtn]
        
        phoneField.delegate = self
        phoneField.tag = 2
        phoneField.keyboardType = .numberPad
        phoneField.inputAccessoryView = toolbar
        
        
        checkBox1.image = UIImage(systemName: "square")
        checkBox1.isUserInteractionEnabled = true
        checkBox1.tintColor = .black
        checkBox1.tag = 11
        checkBox1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkclick(_:))))
        
        checkBox2.image = UIImage(systemName: "square")
        checkBox2.tintColor = .black
        checkBox2.isUserInteractionEnabled = true
        checkBox2.tag = 12
        checkBox2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkclick(_:))))
        
        checkBox3.image = UIImage(systemName: "square")
        checkBox3.tintColor = .black
        checkBox3.isUserInteractionEnabled = true
        checkBox3.tag = 13
        checkBox3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkclick(_:))))
        
        yearField.delegate = self
        yearField.textAlignment = .center
        yearField.insertText(String(1950))
        
        monthField.delegate = self
        monthField.textAlignment = .center
        monthField.insertText(String(1))
        
        dayField.delegate = self
        dayField.textAlignment = .center
        dayField.insertText(String(1))
        
        
        text2.text = "초혼"
        text2.tag = 11
        text2.textColor = .black
        text2.isUserInteractionEnabled = true
        text2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkclick(_:))))
        
        text3.text = "재혼"
        text3.tag = 12
        text3.textColor = .black
        text3.isUserInteractionEnabled = true
        text3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkclick(_:))))
        
        text4.text = "이혼 경험"
        text4.tag = 13
        text4.textColor = .black
        text4.isUserInteractionEnabled = true
        text4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkclick(_:))))
        
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

       
    // MARK: - function
    func createPickerViews(){
        let yearPickerView = UIPickerView()
        yearPickerView.tag = 1
        yearPickerView.delegate = self
        yearField.inputView = yearPickerView
        
        let monthPickerView = UIPickerView()
        monthPickerView.tag = 2
        monthPickerView.delegate = self
        monthField.inputView = monthPickerView
        
        let dayPickerView = UIPickerView()
        dayPickerView.tag = 3
        dayPickerView.delegate = self
        dayField.inputView = dayPickerView
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
        yearField.inputAccessoryView = toolBar
        monthField.inputAccessoryView = toolBar
        dayField.inputAccessoryView = toolBar
    }
    
    // MARK: - objc methods
    @objc func click_doneBtn(){
        view.endEditing(true)
    }
    
    
    @objc func backView(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer1"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func action(){
        self.view.endEditing(true)
    }
    
    @objc func nextview(){
        if !nameField.text!.isEmpty && !yearField.text!.isEmpty && !dayField.text!.isEmpty && !monthField.text!.isEmpty && !phoneField.text!.isEmpty{
            guard  let controller =  self.storyboard?.instantiateViewController(identifier: "AddCustomer3") else { return }
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }else{
            let fail_alert = UIAlertController(title: nil, message: "정보를 다 입력해주세요.", preferredStyle: .alert)
            fail_alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(fail_alert, animated: false, completion: nil)

        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    @objc func checkclick(_ sender: UITapGestureRecognizer){
        if sender.view?.tag == 11 {
            if !checkState1{
                checkBox1.image = UIImage(systemName: "checkmark.square")
                checkState1 = true
            }else {
                checkBox1.image = UIImage(systemName: "square")
                checkState1 = false
            }
        } else if sender.view?.tag == 12 {
            if !checkState2{
                checkBox2.image = UIImage(systemName: "checkmark.square")
                checkState2 = true
            }else {
                checkBox2.image = UIImage(systemName: "square")
                checkState2 = false
            }
        } else if sender.view?.tag == 13 {
            if !checkState3{
                checkBox3.image = UIImage(systemName: "checkmark.square")
                checkState3 = true
            }else {
                checkBox3.image = UIImage(systemName: "square")
                checkState3 = false
            }
        }
    }
    
    // MARK: - AutoLayout
    func AutoConstraints(){
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text1.topAnchor.constraint(equalTo: img1.bottomAnchor, constant: 5).isActive = true
        text1.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        customerName.translatesAutoresizingMaskIntoConstraints = false
        customerName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        customerName.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 50).isActive = true
        customerName.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        customerBirth.translatesAutoresizingMaskIntoConstraints = false
        customerBirth.leftAnchor.constraint(equalTo: customerName.leftAnchor).isActive = true
        customerBirth.topAnchor.constraint(equalTo: customerName.bottomAnchor, constant: 20).isActive = true
        customerBirth.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        customerPhone.translatesAutoresizingMaskIntoConstraints = false
        customerPhone.leftAnchor.constraint(equalTo: customerName.leftAnchor).isActive = true
        customerPhone.topAnchor.constraint(equalTo: customerBirth.bottomAnchor, constant: 20).isActive = true
        customerPhone.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.leftAnchor.constraint(equalTo: customerName.rightAnchor, constant: 5).isActive = true
        nameField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameField.centerYAnchor.constraint(equalTo: customerName.centerYAnchor).isActive = true
        
        yearField.translatesAutoresizingMaskIntoConstraints = false
        yearField.leftAnchor.constraint(equalTo: nameField.leftAnchor).isActive = true
        yearField.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        yearField.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        yearText.translatesAutoresizingMaskIntoConstraints = false
        yearText.leftAnchor.constraint(equalTo: yearField.rightAnchor, constant: 5).isActive = true
        yearText.centerYAnchor.constraint(equalTo: yearField.centerYAnchor).isActive = true
        
        monthField.translatesAutoresizingMaskIntoConstraints = false
        monthField.leftAnchor.constraint(equalTo: yearText.rightAnchor, constant: 10).isActive = true
        monthField.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        monthField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        monthText.translatesAutoresizingMaskIntoConstraints = false
        monthText.leftAnchor.constraint(equalTo: monthField.rightAnchor, constant: 5).isActive = true
        monthText.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        
        dayField.translatesAutoresizingMaskIntoConstraints = false
        dayField.leftAnchor.constraint(equalTo: monthText.rightAnchor, constant: 10).isActive = true
        dayField.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        dayField.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        dayText.translatesAutoresizingMaskIntoConstraints = false
        dayText.leftAnchor.constraint(equalTo: dayField.rightAnchor, constant: 5).isActive = true
        dayText.centerYAnchor.constraint(equalTo: customerBirth.centerYAnchor).isActive = true
        
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        phoneField.leftAnchor.constraint(equalTo: customerPhone.rightAnchor, constant: 5).isActive = true
        phoneField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        phoneField.centerYAnchor.constraint(equalTo: customerPhone.centerYAnchor).isActive = true
        
        checkBox1.translatesAutoresizingMaskIntoConstraints = false
        checkBox1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        checkBox1.topAnchor.constraint(equalTo: customerPhone.bottomAnchor, constant: 50).isActive = true
        checkBox1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBox1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        checkBox2.translatesAutoresizingMaskIntoConstraints = false
        checkBox2.leftAnchor.constraint(equalTo: checkBox1.leftAnchor).isActive = true
        checkBox2.topAnchor.constraint(equalTo: checkBox1.bottomAnchor, constant: 10).isActive = true
        checkBox2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBox2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        checkBox3.translatesAutoresizingMaskIntoConstraints = false
        checkBox3.leftAnchor.constraint(equalTo: checkBox1.leftAnchor).isActive = true
        checkBox3.topAnchor.constraint(equalTo: checkBox2.bottomAnchor, constant: 10).isActive = true
        checkBox3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkBox3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        text2.translatesAutoresizingMaskIntoConstraints = false
        text2.leftAnchor.constraint(equalTo: checkBox1.rightAnchor, constant: 30).isActive = true
        text2.centerYAnchor.constraint(equalTo: checkBox1.centerYAnchor).isActive = true
        
        text3.translatesAutoresizingMaskIntoConstraints = false
        text3.leftAnchor.constraint(equalTo: text2.leftAnchor).isActive = true
        text3.centerYAnchor.constraint(equalTo: checkBox2.centerYAnchor).isActive = true
        
        text4.translatesAutoresizingMaskIntoConstraints = false
        text4.leftAnchor.constraint(equalTo: text3.leftAnchor).isActive = true
        text4.centerYAnchor.constraint(equalTo: checkBox3.centerYAnchor).isActive = true
        
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70).isActive = true
        nextBtn.topAnchor.constraint(equalTo: text4.bottomAnchor, constant: 60).isActive = true
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70).isActive = true
        backBtn.topAnchor.constraint(equalTo: text4.bottomAnchor, constant: 60).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}

extension AddCustomer2: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1{
            nameField.resignFirstResponder()
        }else if textField.tag == 2{
            phoneField.resignFirstResponder()
        }
        return true
    }
}

// MARK: - Extension
extension AddCustomer2: UIPickerViewDelegate{
    
}

extension AddCustomer2: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return year.count
        } else if pickerView.tag == 2{
            return month.count
        } else {
            return day.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return String(year[row])
        } else if pickerView.tag == 2{
            return String(month[row])
        } else {
            return String(day[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1{
            return yearField.text = String(year[row])
        } else if pickerView.tag == 2{
            return monthField.text = String(month[row])
        } else {
            return dayField.text = String(day[row])
        }
    }
    
}
