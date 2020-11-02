//
//  CheckReason.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/25.
//  Copyright © 2020 창민. All rights reserved.
//

import Foundation
import UIKit

class CheckReason: Common{
    
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var reasonTextview: UITextView!
    var reason: String = ""
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        config()
        autoLayout()
    }
    
    fileprivate func config(){
        naviBar.isTranslucent = false
        naviBar.barTintColor = mainColor
        naviBar.topItem?.title = "이혼 사유"
        naviBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        naviBar.shadowImage = UIImage()
        
        backBtn.title = ""
        backBtn.image = UIImage(systemName: "chevron.backward")
        backBtn.tintColor = .white
        backBtn.action = #selector(goBack)
        
        
        reasonTextview.text = reason
        reasonTextview.textColor = .black
        reasonTextview.isEditable = false
        
    }
    
    //MARK:- objc Function
    @objc func goBack(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "customerInfoView") as? CustomerInfo{
            controller.name = self.name
            controller.reason = self.reason
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    //MARK : - AutoLayout
    func autoLayout(){
        
    }

}
