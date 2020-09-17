//
//  myPage.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/10.
//  Copyright © 2020 창민. All rights reserved.
//
import UIKit

class myPage: UIViewController {
    let mainColor = #colorLiteral(red: 1, green: 0.862745098, blue: 0.2235294118, alpha: 1)
   
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var customerLabel: UILabel!
    @IBOutlet weak var customerNum: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        let backBtn = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBtn
        
        naviBar.isTranslucent = false
        naviBar.tintColor = .white
        naviBar.barTintColor = mainColor
        naviBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(leftButtonAction))
        naviBar.topItem?.title = ""
        
        userImage.image = UIImage(systemName: "person")
        //userImage.tintColor = 
        userImage.backgroundColor = .lightGray
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.layer.borderWidth = 1
        userImage.layer.borderColor = UIColor.clear.cgColor
        userImage.clipsToBounds = true
        
        // 사용자 이름은 DB에서 가져오기
        
        customerLabel.text = "의뢰인 수 : "
        customerLabel.sizeToFit()
        customerLabel.textAlignment = .center
        
        // 고객수도 DB에서 가져오기
        customerNum.text = "0명"
        customerNum.textColor = .white
        customerNum.textAlignment = .center
        customerNum.clipsToBounds = true
        customerNum.layer.cornerRadius = 10
        customerNum.layer.borderWidth = 1
        customerNum.backgroundColor = mainColor
        customerNum.layer.borderColor = UIColor.clear.cgColor
        
        
        progressLabel.text = "진행 상태"
        progressLabel.sizeToFit()
        progressLabel.textAlignment = .center
        
        // 프로그레스바 설정
        progressBar.progressTintColor = mainColor
        progressBar.progress = 0.5
    }
    
    @objc func leftButtonAction(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "customerListView"){
            controller.modalPresentationStyle = .currentContext
            //controller.modalTransitionStyle = .coverVertical
            self.present(controller, animated: true, completion: nil)
        }
    }
}
