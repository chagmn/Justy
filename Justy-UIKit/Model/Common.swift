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
  
    // OCR - using Kakao Vision
    // 이미지를 텍스트화 해서 서버에 POST함. 그걸 데이터 베이스에 저장해야함.
    func uploadImageToServer(a: Data){
        let url = API.KAKAO_URL
        let key = API.KAKAO_CLIENT_ID
        
        //guard let image = UIImage(named: "demo") else { return }
        let image2: UIImage = UIImage(data: a)!
        

        print("UploadImageToServer: ")
        
        let data = image2.jpegData(compressionQuality: 1.0)
        let headers: HTTPHeaders = [.authorization(key)]
        
        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(data!, withName: "image", fileName: "ocr_test.jpeg", mimeType: "image/jpeg")
        }, to: url, headers: headers)
        .responseDecodable(of: HTTPBinResponse.self){ response in
            debugPrint(response)
        }
        .validate()
        .responseJSON(completionHandler: {  response in
            
            var texts = [Text]()
            let responseJson =  JSON(response.value!)
            let jsonArray = responseJson["result"]
            
            //print("jsonArray.size : \(jsonArray.count)")
            
            for (_, subJson): (String, JSON) in jsonArray{
                let text = subJson["recognition_words"].array!
               
              
                let textItem = Text(text: text[0].string!)

                texts.append(textItem)
                
            }
            print("\(texts)")
        })
    }
    
}
