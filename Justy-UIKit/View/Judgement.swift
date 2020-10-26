//
//  Judgement.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/15.
//  Copyright © 2020 창민. All rights reserved.
//

import Foundation
import UIKit

class Judgement: Common {
    
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var judgementView: UITextView!
    
    
    var text = ""
    var judgement: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        self.config()
        
    }
    
    fileprivate func config(){
        naviBar.isTranslucent = false
        naviBar.barTintColor = mainColor
        naviBar.topItem?.title = "판결문 확인"
        naviBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        naviBar.shadowImage = UIImage()
        
        backBtn.title = ""
        backBtn.image = UIImage(systemName: "chevron.backward")
        backBtn.tintColor = .white
        backBtn.action = #selector(goBack)
        
        judgementView.textColor = .black
        judgementView.text = judgement
        judgementView.isEditable = false
        
    }
    
    // MARK: - objc method
    @objc func goBack(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "customerInfoView"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
}
