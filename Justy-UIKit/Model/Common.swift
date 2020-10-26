//
//  Common.swift
//  Justy-UIKit
//
//  Created by 창민 on 2020/10/18.
//  Copyright © 2020 창민. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

struct HTTPBinResponse: Decodable {let url: String}

class Common: UIViewController {
    
    let mainColor = #colorLiteral(red: 1, green: 0.8799968362, blue: 0.2822909951, alpha: 1)
    let color = #colorLiteral(red: 0.9882352941, green: 0.9333333333, blue: 0.7137254902, alpha: 1)
    
    var username: String = ""
    var evi1String: String = ""
    var evi2String: String = ""
    var evi3String: String = ""
    var evi4String: String = ""
    var evi5String: String = ""
    var evi6String: String = ""
    var evi7String: String = ""
    var evi8String: String = ""
    var isfinish: Bool = false
  
    // OCR - using Kakao Vision
    // 이미지를 텍스트화 해서 서버에 POST함. 그걸 데이터 베이스에 저장해야함.
    func uploadImageToServer(a: Data, name: String, tag: Int){
        let url = API.KAKAO_URL
        let key = API.KAKAO_CLIENT_ID
        
        //guard let image = UIImage(named: "demo") else { return }
        let image2: UIImage = UIImage(data: a)!
        self.username = name

        print("UploadImageToServer() called")
        
        let data = image2.jpegData(compressionQuality: 1.0)
        let headers: HTTPHeaders = [.authorization(key)]
        
        // 카카오 ocr에 post해서 나온 결과 Text에 저장
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(data!, withName: "image", fileName: "ocr_test.jpeg", mimeType: "image/jpeg")
        }, to: url, headers: headers)
        .responseDecodable(of: HTTPBinResponse.self){ response in
            debugPrint(response)
        }
        .responseJSON(completionHandler: {  response in
            var texts = [Text]()
            let responseJson =  JSON(response.value!)
            let jsonArray = responseJson["result"]
            
            for (_, subJson): (String, JSON) in jsonArray{
                let text = subJson["recognition_words"].arrayValue
                let textItem = Text(text: text[0].string!)
                texts.append(textItem)
            }
            
            switch tag{
            case 1:
                for i in texts {
                    self.evi1String += i.text
                    self.evi1String += " "
                }
                print("evi1 : \(self.evi1String)")
                break
            case 2:
                for i in texts {
                    self.evi2String += i.text
                    self.evi2String += " "
                }
                print("evi2 : \(self.evi2String)")
                break
            case 3:
                for i in texts {
                    self.evi3String += i.text
                    self.evi3String += " "
                }
                print("evi3 : \(self.evi3String)")
                break
            case 4:
                for i in texts {
                    self.evi4String += i.text
                    self.evi4String += " "
                }
                print("evi4 : \(self.evi4String)")
                break
            case 5:
                for i in texts {
                    self.evi5String += i.text
                    self.evi5String += " "
                }
                print("evi5 : \(self.evi5String)")
                break
            case 6:
                for i in texts {
                    self.evi6String += i.text
                    self.evi6String += " "
                }
                print("evi6 : \(self.evi6String)")
                break
            case 7:
                for i in texts {
                    self.evi7String += i.text
                    self.evi7String += " "
                }
                print("evi7 : \(self.evi7String)")
                break
            case 8:
                for i in texts {
                    self.evi8String += i.text
                    self.evi8String += " "
                }
                print("evi8 : \(self.evi8String)")
                break
            default:
                print("실패")
            }
        })
    }
    
    func putEvidence(){
        let params: [String: String] = [
            "evi1": self.evi1String,
            "evi2": self.evi2String,
            "evi3": self.evi3String,
            "evi4": self.evi4String,
            "evi5": self.evi5String,
            "evi6": self.evi6String,
            "evi7": self.evi7String,
            "evi8": self.evi8String,
        ]
        
        // 받은 Text를 REST API 서버에 전송
        let urlString = "http://127.0.0.1:3000/users/\(username)"
        let encodedString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let realURL = URL(string: encodedString)!
        
        AF.request(realURL, method: .put, parameters: params, encoding: JSONEncoding.default)
            .responseJSON(completionHandler: { response2 in
                debugPrint("putREST response : \(response2)")
            })
        
    }
    
}
