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
    @IBOutlet weak var tableView: UITableView!
    
    let customerInfo = [("일번",0.1),("이번",0.3),("삼번",0.5),("사번",0.7),("오번",0.9),]
    
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
        addButton.tintColor = .systemGreen
        addButton.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        
        // 셀 리소스 가져오기
        let customerListNib = UINib(nibName: "customerCell", bundle: nil)
        
        // 셀에 리소스 등록
        self.tableView.register(customerListNib, forCellReuseIdentifier: "customerCell")
        self.tableView.rowHeight = 120
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    
    @objc func goBack(){
        
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
    
    
}
