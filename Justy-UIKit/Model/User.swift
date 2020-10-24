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
    var birth: String
    var phone: String
    var firstmarriage: Bool
    var reason: String
    var child: String
    
    init(name: String, birth: String, phone: String, firstmarriage: Bool, reason: String, child: String){
        self.name = name
        self.birth = birth
        self.phone = phone
        self.firstmarriage = firstmarriage
        self.reason = reason
        self.child = child
    }
    
}
