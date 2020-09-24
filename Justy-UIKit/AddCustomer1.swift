//
//  addCustomer1.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/24.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class AddCustomer1: UIViewController{
    let color = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    @IBOutlet weak var icomImg: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        icomImg.image = UIImage(systemName: "smiley.fill")
        icomImg.tintColor = .lightGray
        
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
        nextBtn.widthAnchor.constraint(equalToConstant: 80).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
}
