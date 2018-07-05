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
            user.setValue(loginEntity.UrlAvatar, forKeyPath: "urlAvatar")
            user.setValue(loginEntity.UrlCardImage, forKeyPath: "urlCardImage")
            user.setValue(loginEntity.UrlImage1, forKeyPath: "urlImage1")
            user.setValue(loginEntity.UrlImage2, forKeyPath: "urlImage2")
            user.setValue(loginEntity.IdNumber, forKeyPath: "idNumber")
            user.setValue(loginEntity.Level, forKeyPath: "level")
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
    
    func getImageID(imageName: String, completion: @escaping (Int) -> ()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Images")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let imgName = data.value(forKey: "imageName") as! String
                if(imageName == imgName) {
                    completion(data.value(forKey: "id") as! Int)
                    return
                }
            }
        } catch {
            completion(0)
        }
    }
    
    func getImageFromDB(imageName:String, completion:@escaping (_ uploadImageResultEntity:UploadImageResultEntity) -> ()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Images")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let imgName = data.value(forKey: "imageName") as! String
                if(imageName == imgName) {
                    let imageEntity = ImageEntity(
                        imageType:  data.value(forKey: "imageType") as? String,
                        url:        data.value(forKey: "url") as? String,
                        id:         data.value(forKey: "id") as? Int
                    )
                    let uploadImageResultEntity = UploadImageResultEntity(
                        image:      imageEntity,
                        message:    "Success",
                        statuscode: 200
                    )
                    completion(uploadImageResultEntity)
                    return
                }
            }
        } catch {
            
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
    
    func saveImageToLocal(fileName:String, image:UIImage) {
        let imageData:NSData = UIImageJPEGRepresentation(image, 0.8)! as NSData
        UserDefaults.standard.set(imageData, forKey: fileName)
    }
    
    func saveImageToDB(uploadImageResultEntity:UploadImageResultEntity, imageName:String, username:String, type:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Images")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                let user:String = (managedObjectData.value(forKey: "user") as? String)!
                let imgType:String = (managedObjectData.value(forKey: "imageType") as? String)!
                if(user == username && imgType == type) {
                    managedContext.delete(managedObjectData)
                }
            }
            
            let imageEntity = NSEntityDescription.entity(forEntityName: "Images", in: managedContext)!
            let image = NSManagedObject(entity: imageEntity, insertInto: managedContext)
            image.setValue(uploadImageResultEntity.image?.id, forKeyPath: "id")
            image.setValue(uploadImageResultEntity.image?.url, forKeyPath: "url")
            image.setValue(type, forKeyPath: "imageType")
            image.setValue(imageName, forKeyPath: "imageName")
            image.setValue(username, forKeyPath: "user")
            image.setValue(uploadImageResultEntity.image?.imageType, forKeyPath: "format")
            
            try managedContext.save()
        } catch {
            print("Error")
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
                        StatusCode:     Utils.getIntValueInDic(dic: json, key: "StatusCode"),
                        Message:        Utils.getStringValueInDic(dic: json, key: "Message"),
                        Token:          Utils.getStringValueInDic(dic: json, key: "Token"),
                        Address:        Utils.getStringValueInDic(dic: dic, key: "Address"),
                        BankAccNumber:  Utils.getStringValueInDic(dic: dic, key: "BankAccNumber"),
                        CardTerm:       Utils.getStringValueInDic(dic: dic, key: "CardTerm"),
                        DateOfBirth:    Utils.getStringValueInDic(dic: dic, key: "DateOfBirth"),
                        Fullname:       Utils.getStringValueInDic(dic: dic, key: "Fullname"),
                        UrlAvatar:       Utils.getStringValueInDic(dic: dic, key: "UrlAvatar"),
                        UrlCardImage:    Utils.getStringValueInDic(dic: dic, key: "UrlCardImage"),
                        UrlImage1:       Utils.getStringValueInDic(dic: dic, key: "UrlImage1"),
                        UrlImage2:       Utils.getStringValueInDic(dic: dic, key: "UrlImage2"),
                        IdNumber:       Utils.getStringValueInDic(dic: dic, key: "IdNumber"),
                        Level:          Utils.getIntValueInDic(dic: dic, key: "Level"),
                        Progress:       Utils.getIntValueInDic(dic: dic, key: "Progress"),
                        Scored:         Utils.getNumberValueInDic(dic: dic, key: "Scored"),
                        Sex:            Utils.getIntValueInDic(dic: dic, key: "Sex"),
                        UserId:         Utils.getStringValueInDic(dic: dic, key: "UserId"),
                        Username:       Utils.getStringValueInDic(dic: dic, key: "Username")
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
