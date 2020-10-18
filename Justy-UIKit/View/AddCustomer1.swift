//
//  addCustomer1.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/24.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class AddCustomer1: Common{
    
    @IBOutlet weak var icomImg: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
         
        self.config()
    }
    
    fileprivate func config(){
        icomImg.image = UIImage(systemName: "smiley")
        icomImg.tintColor = .black
        
        text1.text = "반갑습니다"
        text1.tintColor = .black
        text1.textAlignment = .center
        text1.font = UIFont.boldSystemFont(ofSize: 32.0)
        
        text2.text = "기본 데이터 수집을 위하여 저희가 \n제시한 문항에 대해 답변해주세요"
        text2.textAlignment = .center
        text2.textColor = .black
        text2.numberOfLines = 0
        text2.backgroundColor = color

        nextBtn.setTitle("next>", for: .normal)
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 21.0)
        nextBtn.tintColor = .white
        nextBtn.backgroundColor = mainColor
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.cornerRadius = 20
        nextBtn.clipsToBounds = true
        nextBtn.layer.borderColor = UIColor.clear.cgColor
        nextBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nextBtn.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        
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
    @objc func backView(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "customerListView"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func nextView(){
        if let controller = self.storyboard?.instantiateViewController(identifier: "AddCustomer2"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
        
    }
}
