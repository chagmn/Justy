//
//  customerList.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/17.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit

class customerList: UIViewController{
    let mainColor = #colorLiteral(red: 1, green: 0.8784313725, blue: 0.2823529412, alpha: 1)
    
    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftBtn: UIBarButtonItem!
    
    let customerInfo = [("일번",0.1),("이번",0.3),("삼번",0.5),("사번",0.7),("오번",0.9),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        naviBar.isTranslucent = false
        naviBar.barTintColor = mainColor
        naviBar.topItem?.title = "회원 관리"
        naviBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        naviBar.shadowImage = UIImage()

        leftBtn.title = ""
        leftBtn.image = UIImage(systemName: "chevron.backward")
        leftBtn.tintColor = .white

        
        addButton.setTitle("", for: .normal)
        addButton.tintColor = mainColor
        addButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        
        // 셀 리소스 가져오기
        let customerListNib = UINib(nibName: "customerCell", bundle: nil)
        
        // 셀에 리소스 등록
        self.tableView.register(customerListNib, forCellReuseIdentifier: "customerCell")
        self.tableView.rowHeight = 120
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    
    @IBAction func goBack(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "myPageView"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
}


extension customerList: UITableViewDelegate{
    
}

extension customerList: UITableViewDataSource{
    // 테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerInfo.count
    }
    
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath) as! customerCell
        let (name, progress) = customerInfo[indexPath.row]
        
        cell.customerName.text = name
        cell.customerProgress.progress = Float(progress)
        
        return cell
    }
    
    // 각 셀 선택됐을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRow(at: indexPath) as! customerCell
        
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "customerInfoView") as? CustomerInfo else {
            return
        }
        
        controller.name = cell.customerName.text!
        controller.progressNum = cell.customerProgress.progress
        controller.modalPresentationStyle = .currentContext
        self.present(controller, animated: false, completion: nil)
        
    }
    
    
}
