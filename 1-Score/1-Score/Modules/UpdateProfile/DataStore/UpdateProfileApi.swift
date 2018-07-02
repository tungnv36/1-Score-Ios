//
//  UpdateProfileApi.swift
//  1-Score
//
//  Created by TIMA on 6/30/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class UpdateProfileApi {

    func uploadImage(token:String, uploadImageEntity:UploadImageEntity, completion:@escaping (_ json: [String: Any]) -> ()) {
        let parameters = [
            "username": uploadImageEntity.username ?? "",
            "type": uploadImageEntity.type ?? "",
            "base64_image": uploadImageEntity.base64_image ?? ""
        ]
        
        let url = URL(string: StringEnum.API_BASE_URL.rawValue + "images/upload")!
        print(url)
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            print("============================")
            print(request)
            print("============================")
            print(response ?? "")
            print("============================")
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    completion(json)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    func updateProfile(token:String, updateProfileEntity:UpdateProfileEntity, completion:@escaping (_ json: [String: Any]) -> ()) {
        let parameters:Dictionary<String, Any> = [
            "username": updateProfileEntity.username ?? "",
            "fullname": updateProfileEntity.fullname ?? "",
            "date_of_birth": updateProfileEntity.date_of_birth ?? "",
            "id_number": updateProfileEntity.id_number ?? "",
            "address": updateProfileEntity.address ?? "",
            "id_image_1": updateProfileEntity.id_image_1 ?? 0,
            "id_image_2": updateProfileEntity.id_image_2 ?? 0,
            "bank_acc_number": updateProfileEntity.bank_acc_number ?? "",
            "card_term": updateProfileEntity.card_term ?? "",
            "id_card_image": updateProfileEntity.id_card_image ?? 0,
            "sex": updateProfileEntity.sex ?? 0
        ]
        
        let url = URL(string: StringEnum.API_BASE_URL.rawValue + "profile")!
        print(url)
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    completion(json)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
}
