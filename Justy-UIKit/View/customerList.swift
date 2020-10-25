//
//  customerList.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/09/17.
//  Copyright © 2020 창민. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class customerList: Common{

    @IBOutlet weak var naviBar: UINavigationBar!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var leftBtn: UIBarButtonItem!
    
    var customerNameArray: [String] = []
    var reasonArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
    
        getData()
 
    }
    
    // REST API 서버에서 데이터 가져오기.
    func getData(){

        AF
            .request("http://127.0.0.1:3000/users/")
            .responseJSON(completionHandler: { response in
                let responseJson =  JSON(response.value!)
               
                for (_, subJson): (String, JSON) in responseJson{
                    let name = subJson["name"].string!
                    let reason = subJson["reason"].string!
              
                    self.customerNameArray.append(name)
                    self.reasonArray.append(reason)
                    
                }
        
                self.config()
            })
    }
    
    fileprivate func config(){
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
        addButton.addTarget(self, action: #selector(addCustomer), for: .touchUpInside)
        
        // 셀 리소스 가져오기
        let customerListNib = UINib(nibName: "customerCell", bundle: nil)
        
        // 셀에 리소스 등록
        self.tableView.register(customerListNib, forCellReuseIdentifier: "customerCell")
        self.tableView.rowHeight = 120
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - IBAction methods
    @IBAction func goBack(_ sender: Any) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "myPageView"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    // MARK: - objc methods
    @objc func addCustomer(){
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "AddCustomer1"){
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: true, completion: nil)
        }
    }
}

// MARK: - Extension
extension customerList: UITableViewDelegate{
    
}

extension customerList: UITableViewDataSource{
    // 테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerNameArray.count
    }
    
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customerCell", for: indexPath) as! customerCell
        let name = customerNameArray[indexPath.row]
        let reason = reasonArray[indexPath.row]
        
        cell.customerName.text = name
        cell.customerReason = reason
        cell.customerProgress.progress = 0.1
        
        return cell
    }
    
    // 각 셀 선택됐을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRow(at: indexPath) as! customerCell
        
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "customerInfoView") as? CustomerInfo {
            
            controller.name = cell.customerName.text!
            controller.reason = cell.customerReason
            controller.progressNum = 0.1
            controller.modalPresentationStyle = .currentContext
            self.present(controller, animated: false, completion: nil)
        }
        
    }
    
    
}
