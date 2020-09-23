//
//  CustomerInfo.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/22.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class CustomerInfo: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var customerImg: UIImageView!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var evidence1: UILabel!
    @IBOutlet weak var evidence2: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var textfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        naviBar.backgroundColor = mainColor
        naviBar.topItem?.title = "회원 관리"
        naviBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        naviBar.isTranslucent = false
        naviBar.shadowImage = UIImage()
        
        backBtn.title = ""
        backBtn.image = UIImage(systemName: "chevron.backward")
        backBtn.tintColor = .white
        
        // 이전 뷰에서 값 넘겨 받기
        customerName.text = ""
        
        // 재판 진행 상황 -> progress 에 따라
        state.backgroundColor = mainColor
        state.textColor = .white
        state.textAlignment = .center
        state.clipsToBounds = true
        state.layer.cornerRadius = 10
        state.layer.borderWidth = 1
        state.backgroundColor = mainColor
        state.layer.borderColor = UIColor.clear.cgColor
        
        progress.progress = 0.5
        progress.tintColor = mainColor
        
        checkBtn.setTitle("재판 상황 확인", for: .normal)
        checkBtn.tintColor = .black
        // 이어서
        
    }
}
