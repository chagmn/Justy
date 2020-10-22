//
//  AddCustomerLast.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/04.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class AddCustomerLast: Common{
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        autoLayout()
        
        self.config()
    }
    
    fileprivate func config(){
        img.image = UIImage(systemName: "smiley")
        img.tintColor = .black
        
        text1.text = "감사합니다."
        text1.textColor = .black
        text1.textAlignment = .center
        text1.font = UIFont.boldSystemFont(ofSize: 32)
        
        text2.text = "기본적인 데이터 수집을 완료했습니다.\n참여해주셔서 감사합니다."
        text2.textColor = .black
        text2.backgroundColor = #colorLiteral(red: 0.9999489188, green: 0.9309895635, blue: 0.6852593422, alpha: 1)
        text2.textAlignment = .center
        text2.numberOfLines = 0
        
        btn.setTitle("next>", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 21.0)
        btn.tintColor = .white
        btn.backgroundColor = mainColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.layer.borderColor = UIColor.clear.cgColor
        btn.addTarget(self, action: #selector(nextview), for: .touchUpInside)
        
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
    
    
    // MARK: - objc methods
    @objc func nextview(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "customerListView"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
        
    }
    
    @objc func backView(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer5"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    
    // MARK: - autoLayout
    func autoLayout(){
        img.translatesAutoresizingMaskIntoConstraints = false
        img.widthAnchor.constraint(equalToConstant: 90).isActive = true
        img.heightAnchor.constraint(equalTo: img.widthAnchor).isActive = true
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        
        text1.translatesAutoresizingMaskIntoConstraints = false
        text1.widthAnchor.constraint(equalToConstant: 150).isActive = true
        text1.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 5).isActive = true
        text1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        text2.translatesAutoresizingMaskIntoConstraints = false
        text2.widthAnchor.constraint(equalToConstant: 280).isActive = true
        text2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        text2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        text2.topAnchor.constraint(equalTo: text1.bottomAnchor, constant: 10).isActive = true
    
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 70).isActive = true
        btn.topAnchor.constraint(equalTo: text2.bottomAnchor, constant: 120).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70).isActive = true
        backBtn.topAnchor.constraint(equalTo: btn.topAnchor).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
