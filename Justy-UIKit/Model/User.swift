//
//  User.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/24.
//  Copyright © 2020 창민. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct User{
    var name: String
    var birth: Int
    var phone: Int
    var firstmarriage: Bool
    var reason: String
    var child: String
    
    
    // 정보 전달
    func PostInfo(){
        let params: [String: Any] = [
            "name": self.name,
            "birth": self.birth,
            "phone": self.phone,
            "firstmarriage": self.firstmarriage,
            "reason": self.reason,
            "child": self.child
        ]
        
        AF.request("http://127.0.0.1:3000/users",method: .post, parameters: params)
            .responseJSON(completionHandler: { response in
                debugPrint("response : \(response)")
            })
    }
}
