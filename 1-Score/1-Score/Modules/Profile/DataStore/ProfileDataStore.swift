//
//  ProfileDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/13/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import CoreData

class ProfileDataStore : ProfileDataStoreProtocol {
    
    func getUser(completion: @escaping (LoginResultEntity) -> ()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let loginResultEntity = LoginResultEntity(
                    StatusCode:     data.value(forKey: "statusCode") as? Int,
                    Message:        data.value(forKey: "message") as? String,
                    Token:          data.value(forKey: "token") as? String,
                    Address:        data.value(forKey: "address") as? String,
                    BankAccNumber:  data.value(forKey: "bankAccNumber") as? String,
                    CardTerm:       data.value(forKey: "cardTerm") as? String,
                    DateOfBirth:    data.value(forKey: "dateOfBirth") as? String,
                    Fullname:       data.value(forKey: "fullname") as? String,
                    UrlAvatar:       data.value(forKey: "urlAvatar") as? String,
                    UrlCardImage:    data.value(forKey: "urlCardImage") as? String,
                    UrlImage1:       data.value(forKey: "urlImage1") as? String,
                    UrlImage2:       data.value(forKey: "urlImage2") as? String,
                    IdNumber:       data.value(forKey: "idNumber") as? String,
                    Level:          data.value(forKey: "level") as? Int,
                    Progress:       data.value(forKey: "progress") as? Int,
                    Scored:         data.value(forKey: "scored") as? NSNumber,
                    Sex:            data.value(forKey: "sex") as? Int,
                    UserId:         data.value(forKey: "userId") as? String,
                    Username:       data.value(forKey: "username") as? String
                )
                completion(loginResultEntity)
            }
        } catch {
            print("Failed")
        }
    }
    
}
