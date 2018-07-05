//
//  HomePageDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import CoreData

class HomePageDataStore : HomePageDataStoreProtocol {
    
    let _homePageApi = HomePageApi()
    
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
    
    func saveImageToLocal(fileName: String, image: UIImage) {
        let imageData:NSData = UIImageJPEGRepresentation(image, 0.8)! as NSData
        UserDefaults.standard.set(imageData, forKey: fileName)
    }
    
    func saveImageToDB(uploadImageResultEntity: UploadImageResultEntity, imageName: String, username: String, type: String) {
        print(uploadImageResultEntity)
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
    
    func uploadImage(token: String, uploadImageEntity: UploadImageEntity, completion: @escaping (UploadImageResultEntity) -> ()) {
        _homePageApi.uploadImage(token: token, uploadImageEntity: uploadImageEntity)  { (json : [String : Any]) in
            print(json)
            let dicImage = json["Image"] is NSNull ? nil : (json["Image"] as? Dictionary<String, Any>)!
            let imageEntity = ImageEntity(
                imageType:  dicImage!["ImageType"] is NSNull ? "" : (dicImage!["ImageType"] as? String)!,
                url:        dicImage!["ImageUrl"] is NSNull ? "" : (dicImage!["ImageUrl"] as? String)!,
                id:         dicImage!["Id"] is NSNull ? 0 : (dicImage!["Id"] as? Int)!
            )
            let uploadImageResultEntity = UploadImageResultEntity(
                image:      imageEntity,
                message:    json["Message"] is NSNull ? "" : (json["Message"] as? String)!,
                statuscode: json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!
            )
            completion(uploadImageResultEntity)
        }
    }
    
}
