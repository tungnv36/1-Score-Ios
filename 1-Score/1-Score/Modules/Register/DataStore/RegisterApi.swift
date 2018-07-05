//
//  RegisterApi.swift
//  1-Score
//
//  Created by TIMA on 6/26/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class RegisterApi {
    
    func callRegister(registerEntity:RegisterEntity, completion:@escaping (_ json: [String: Any]) -> ()) {
        let parameters = [
            "username": registerEntity.username,
            "password": registerEntity.password,
            "confirm_password": registerEntity.confirm_password,
            "fullname": registerEntity.fullname
        ] as! Dictionary<String, String>
        
        let url = URL(string: StringEnum.API_BASE_URL.rawValue + "user/register")!
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
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                print(data)
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
