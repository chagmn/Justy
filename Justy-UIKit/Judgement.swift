//
//  Judgement.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/15.
//  Copyright © 2020 창민. All rights reserved.
//

import Foundation
import UIKit

class Judgement: UIViewController {
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var judgement: UITextView!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        naviBar.isTranslucent = false
        naviBar.barTintColor = mainColor
        naviBar.topItem?.title = "판결문 확인"
        naviBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        naviBar.shadowImage = UIImage()
        
        backBtn.title = ""
        backBtn.image = UIImage(systemName: "chevron.backward")
        backBtn.tintColor = .white
        backBtn.action = #selector(goBack)
        
        judgement.textColor = .black
        
        
    }
    @objc func goBack(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "customerInfoView"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
}
