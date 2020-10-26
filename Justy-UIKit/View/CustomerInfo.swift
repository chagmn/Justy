//
//  CustomerInfo.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/22.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class CustomerInfo: Common{
    
    var evi1State:Bool = false
    var evi2State:Bool = false

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var customerImg: UIImageView!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var evidence1: UILabel!
    @IBOutlet weak var evidenceImg1: UIImageView!
    @IBOutlet weak var evidence2: UILabel!
    @IBOutlet weak var evidenceImg2: UIImageView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var judgementBtn: UIButton!
    @IBOutlet weak var reasonView: UIButton!
    
    
    var name: String = ""
    var progressNum: Float = 0.0
    var reason: String = ""
    var judgement: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        self.config()
    }
    
    fileprivate func config(){
        naviBar.isTranslucent = false
        naviBar.barTintColor = mainColor
        naviBar.topItem?.title = "회원 관리"
        naviBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        naviBar.shadowImage = UIImage()
        
        backBtn.title = ""
        backBtn.image = UIImage(systemName: "chevron.backward")
        backBtn.tintColor = .white
        backBtn.action = #selector(goBack)
        
        customerImg.image = UIImage(systemName: "person")
        customerImg.backgroundColor = .lightGray
        customerImg.tintColor = .white
        customerImg.layer.cornerRadius = customerImg.frame.width / 2
        customerImg.layer.borderWidth = 1
        customerImg.clipsToBounds = true
        customerImg.layer.borderColor = UIColor.clear.cgColor
        
        // 이전 뷰에서 값 넘겨 받기
        customerName.text = name
        customerName.textAlignment = .center
        
        // 재판 진행 상황 -> progress 에 따라
        // 소제기 -> 가사조사 -> 조정절차 -> 이혼소송 ->
        // 판결선고에 따른 이혼 -> 이혼신고
        state.text = "소제기"
        state.textColor = .white
        state.backgroundColor = mainColor
        state.textAlignment = .center
        state.clipsToBounds = true
        state.layer.cornerRadius = 10
        state.layer.borderWidth = 1
        state.layer.borderColor = UIColor.clear.cgColor
        
        progress.progress = progressNum
        progress.tintColor = mainColor
        
        
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(checkclick1(_:)))
        
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(checkclick2(_:)))
        
        evidence1.text = "소장 부본 제출"
        evidence1.tintColor = .black
        evidence1.isUserInteractionEnabled = true
        evidence1.addGestureRecognizer(gesture1)
        
        evidenceImg1.image = UIImage(systemName: "square")
        evidenceImg1.tintColor = .black
        
        evidence2.text = "등본 제출"
        evidence2.tintColor = .black
        evidence2.isUserInteractionEnabled = true
        evidence2.addGestureRecognizer(gesture2)
   
        evidenceImg2.image = UIImage(systemName: "square")
        evidenceImg2.tintColor = .black
        
        submitBtn.setTitle("증거물 제출", for: .normal)
        submitBtn.tintColor = .white
        submitBtn.backgroundColor = mainColor
        submitBtn.clipsToBounds = true
        submitBtn.layer.cornerRadius = 10
        submitBtn.layer.borderWidth = 1
        submitBtn.layer.borderColor = UIColor.clear.cgColor
        submitBtn.addTarget(self, action: #selector(goEvidence), for: .touchUpInside)
        
        
        reasonView.setTitle("이혼 사유 확인", for: .normal)
        reasonView.tintColor = .white
        reasonView.backgroundColor = mainColor
        reasonView.clipsToBounds = true
        reasonView.layer.cornerRadius = 10
        reasonView.layer.borderWidth = 1
        reasonView.layer.borderColor = UIColor.clear.cgColor
        reasonView.addTarget(self, action: #selector(checkreason), for: .touchUpInside)
        
        judgementBtn.setTitle("재판 결과 확인", for: .normal)
        judgementBtn.tintColor = .white
        judgementBtn.backgroundColor = mainColor
        judgementBtn.clipsToBounds = true
        judgementBtn.layer.cornerRadius = 10
        judgementBtn.layer.borderWidth = 1
        judgementBtn.layer.borderColor = UIColor.clear.cgColor
        judgementBtn.addTarget(self, action: #selector(checkJudgement), for: .touchUpInside)
    }

    // MARK: - objc methods
    @objc func checkJudgement(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "JudgementView")as? Judgement{
            controller.judgement = self.judgement
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func checkreason(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "checkReason") as? CheckReason{
            controller.reason = self.reason
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func goEvidence(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "AddCustomer5"){
            
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func checkclick1(_ sender: UITapGestureRecognizer){
        if !evi1State{
            evidenceImg1.image = UIImage(systemName: "checkmark.square")
            evi1State = true
        }else {
            evidenceImg1.image = UIImage(systemName: "square")
            evi1State = false
        }
    }
    
    @objc func checkclick2(_ sender: UITapGestureRecognizer){
        if !evi2State{
            evidenceImg2.image = UIImage(systemName: "checkmark.square")
            evi2State = true
        }else {
            evidenceImg2.image = UIImage(systemName: "square")
            evi2State = false
        }
    }
    
    @objc func goBack(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "customerListView"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }

}
