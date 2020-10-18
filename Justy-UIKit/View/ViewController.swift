//
//  ViewController.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/08/17.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let btn_Color = UIColor(red: 255.0, green: 220.0, blue: 57.0, alpha: 1.0)
    let btn_Login = UIButton()
    let btn_Join = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light // 항상 light mode 
        btn_Login.setTitle("LOGIN", for: .normal)
        btn_Login.setTitleColor(.white, for: .normal)
        btn_Login.backgroundColor = btn_Color
    }

    @IBAction func login_btn(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "LoginView"){
            //controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical

            self.present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func join_btn(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "JoinView"){
            //controller.modalPresentationStyle = .currentContext
            controller.modalTransitionStyle = .coverVertical
            self.present(controller, animated: true, completion: nil)
        }
    }
}

