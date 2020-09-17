//
//  customerList.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/17.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class customerList: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        naviBar.isTranslucent = false
        naviBar.barTintColor = mainColor
        naviBar.topItem?.title = "회원 관리"
        naviBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        
        //naviBar.topItem?.le.backBarButtonItem = UIBarButtonItem(title : "Back", style: .plain, target: self, action: #selector(goBack))
        naviBar.shadowImage = UIImage()

        
        addButton.setTitle("", for: .normal)
        addButton.tintColor = mainColor
        addButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)

    }
    

    
    @objc func goBack(){
        
    }
}
