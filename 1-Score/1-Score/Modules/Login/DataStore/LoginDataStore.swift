//
//  LoginDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import CoreData

class LoginDataStore : LoginDataStoreProtocol {
    
    let _loginApi = LoginApi()
    
    func updateUser(loginEntity:LoginResultEntity) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
            
            let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue(loginEntity.StatusCode, forKeyPath: "statusCode")
            user.setValue(loginEntity.Message, forKeyPath: "message")
            user.setValue(loginEntity.Token, forKeyPath: "token")
            user.setValue(loginEntity.Address, forKeyPath: "address")
            user.setValue(loginEntity.BankAccNumber, forKeyPath: "bankAccNumber")
            user.setValue(loginEntity.CardTerm, forKeyPath: "cardTerm")
            user.setValue(loginEntity.DateOfBirth, forKeyPath: "dateOfBirth")
            user.setValue(loginEntity.Fullname, forKeyPath: "fullname")
            user.setValue(loginEntity.IdAvatar, forKeyPath: "idAvatar")
            user.setValue(loginEntity.IdCardImage, forKeyPath: "idCardImage")
            user.setValue(loginEntity.IdImage1, forKeyPath: "idImage1")
            user.setValue(loginEntity.IdImage2, forKeyPath: "idImage2")
            user.setValue(loginEntity.IdNumber, forKeyPath: "idNumber")
            user.setValue(loginEntity.Level, forKeyPath: "level")
            user.setValue(loginEntity.Phone, forKeyPath: "phone")
            user.setValue(loginEntity.Progress, forKeyPath: "progress")
            user.setValue(loginEntity.Scored, forKeyPath: "scored")
            user.setValue(loginEntity.Sex, forKeyPath: "sex")
            user.setValue(loginEntity.UserId, forKeyPath: "userId")
            user.setValue(loginEntity.Username, forKeyPath: "username")
            
            try managedContext.save()
        } catch {
            print("Delete all data")
        }
    }
    
    func getUser(completion: @escaping (LoginResultEntity) -> ()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "fullname") as! String)
            }
        } catch {
            print("Failed")
        }
    }
    
    func callLogin(loginEntity: LoginEntity, completion:@escaping (_ loginResultEntity: LoginResultEntity) -> ()) {
        _loginApi.callLogin(loginEntity: loginEntity) { (json : [String : Any]) in
            print(json)
            if((json["StatusCode"] as! Int) == 200) {
                let dic = json["User"] as! Dictionary<String, Any>
                if(dic.count == 0) {
                    var loginResultEntity = LoginResultEntity.init()
                    loginResultEntity.StatusCode = json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!
                    loginResultEntity.Message = json["Message"] is NSNull ? "" : (json["Message"] as? String)!
                    loginResultEntity.Token = ""
                    completion(loginResultEntity)
                } else {
                    let loginResultEntity = LoginResultEntity(
                        StatusCode:     json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!,
                        Message:        json["Message"] is NSNull ? "" : (json["Message"] as? String)!,
                        Token:          json["Token"] is NSNull ? "" : (json["Token"] as? String)!,
                        Address:        dic["Address"] is NSNull ? "" : (dic["Address"] as? String)!,
                        BankAccNumber:  dic["BankAccNumber"] is NSNull ? "" : (dic["BankAccNumber"] as? String)!,
                        CardTerm:       dic["CardTerm"] is NSNull ? "" : (dic["CardTerm"] as? String)!,
                        DateOfBirth:    dic["DateOfBirth"] is NSNull ? "" : (dic["DateOfBirth"] as? String)!,
                        Fullname:       dic["Fullname"] is NSNull ? "" : (dic["Fullname"] as? String)!,
                        IdAvatar:       dic["IdAvatar"] is NSNull ? 0 : (dic["IdAvatar"] as? Int)!,
                        IdCardImage:    dic["IdCardImage"] is NSNull ? 0 : (dic["IdCardImage"] as? Int)!,
                        IdImage1:       dic["IdImage1"] is NSNull ? "" : (dic["IdImage1"] as? String)!,
                        IdImage2:       dic["IdImage2"] is NSNull ? "" : (dic["IdImage2"] as? String)!,
                        IdNumber:       dic["IdNumber"] is NSNull ? "" : (dic["IdNumber"] as? String)!,
                        Level:          dic["Level"] is NSNull ? 0  : (dic["Level"] as? Int)!,
                        Phone:          dic["Phone"] is NSNull ? "" : (dic["Phone"] as? String)!,
                        Progress:       dic["Progress"] is NSNull ? 0  : (dic["Progress"] as? Int)!,
                        Scored:         dic["Scored"] is NSNull ? 0  : (dic["Scored"] as? NSNumber)!,
                        Sex:            dic["Sex"] is NSNull ? "0"  : (dic["Sex"] as? String)!,
                        UserId:         dic["UserId"] is NSNull ? 0  : (dic["UserId"] as? Int)!,
                        Username:       dic["Username"] is NSNull ? "" : (dic["Username"] as? String)!
                    )
                    completion(loginResultEntity)
                }
            } else {
                var loginResultEntity = LoginResultEntity.init()
                loginResultEntity.StatusCode = json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!
                loginResultEntity.Message = json["Message"] is NSNull ? "" : (json["Message"] as? String)!
                completion(loginResultEntity)
            }
        }
    }
    
}
