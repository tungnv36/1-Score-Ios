//
//  UpdateProfileDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/19/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class UpdateProfileDataStore : UpdateProfileDataStoreProtocol {
    
    let _homePageApi = HomePageApi()
    let _updateProfileApi = UpdateProfileApi()
    
    func getImage(imageName:String) -> Int {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Images")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                if((data.value(forKey: "imageName") as? String)! == imageName) {
                    return (data.value(forKey: "id") as? Int)!
                }
            }
        } catch {
            print("Failed")
        }
        return 0
    }
    
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
                    IdAvatar:       data.value(forKey: "idAvatar") as? Int,
                    IdCardImage:    data.value(forKey: "idCardImage") as? Int,
                    IdImage1:       data.value(forKey: "idImage1") as? String,
                    IdImage2:       data.value(forKey: "idImage2") as? String,
                    IdNumber:       data.value(forKey: "idNumber") as? String,
                    Level:          data.value(forKey: "level") as? Int,
                    Phone:          data.value(forKey: "phone") as? String,
                    Progress:       data.value(forKey: "progress") as? Int,
                    Scored:         data.value(forKey: "scored") as? NSNumber,
                    Sex:            data.value(forKey: "sex") as? String,
                    UserId:         data.value(forKey: "userId") as? Int,
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
    
    func saveImageToDB(uploadImageResultEntity: UploadImageResultEntity, imageName: String, username: String, imageType: String) {
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
                if(user == username && imgType == imageType) {
                    managedContext.delete(managedObjectData)
                }
            }
            
            let imageEntity = NSEntityDescription.entity(forEntityName: "Images", in: managedContext)!
            let image = NSManagedObject(entity: imageEntity, insertInto: managedContext)
            image.setValue(uploadImageResultEntity.image?.id ?? 0, forKeyPath: "id")
            image.setValue(uploadImageResultEntity.image?.url ?? "", forKeyPath: "url")
            image.setValue(imageType, forKeyPath: "imageType")
            image.setValue(imageName, forKeyPath: "imageName")
            image.setValue(username, forKeyPath: "user")
            image.setValue(uploadImageResultEntity.image?.imageType ?? "", forKeyPath: "format")
            
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
    
    func updateProfileToDB(updateProfileResultEntity: UpdateProfileResultEntity) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                let user:String = (managedObjectData.value(forKey: "username") as? String)!
                if(user == updateProfileResultEntity.Profile?.Username) {
                    managedContext.delete(managedObjectData)
                }
            }
            
            let profileEntity = NSEntityDescription.entity(forEntityName: "Profile", in: managedContext)!
            let profile = NSManagedObject(entity: profileEntity, insertInto: managedContext)
            profile.setValue(updateProfileResultEntity.StatusCode ?? 0, forKeyPath: "statusCode")
            profile.setValue(updateProfileResultEntity.Message ?? "", forKeyPath: "message")
            profile.setValue(updateProfileResultEntity.Profile?.UpdatedDate ?? 0, forKeyPath: "updatedDate")
            profile.setValue(updateProfileResultEntity.Profile?.CreatedDate ?? 0, forKeyPath: "createdDate")
            profile.setValue(updateProfileResultEntity.Profile?.CardTerm ?? "", forKeyPath: "cardTerm")
            profile.setValue(updateProfileResultEntity.Profile?.BankAccNumber ?? "", forKeyPath: "bankAccNumber")
            profile.setValue(updateProfileResultEntity.Profile?.IdImage1 ?? "", forKeyPath: "idImage1")
            profile.setValue(updateProfileResultEntity.Profile?.IdNumber ?? "", forKeyPath: "idNumber")
            profile.setValue(updateProfileResultEntity.Profile?.DateOfBirth ?? "", forKeyPath: "dateOfBirth")
            profile.setValue(updateProfileResultEntity.Profile?.Fullname ?? "", forKeyPath: "fullname")
            profile.setValue(updateProfileResultEntity.Profile?.Fullname ?? "", forKeyPath: "fullname")
            profile.setValue(updateProfileResultEntity.Profile?.Username ?? "", forKeyPath: "username")
            profile.setValue(updateProfileResultEntity.Profile?.Id ?? 0, forKeyPath: "id")
            
            try managedContext.save()
        } catch {
            print("Error")
        }
    }
    
    func updateProfile(token: String, updateProfileEntity: UpdateProfileEntity, completion: @escaping (UpdateProfileResultEntity) -> ()) {
        _updateProfileApi.updateProfile(token: token, updateProfileEntity: updateProfileEntity) { (json : [String : Any]) in
            print(json)
            let dicProfile = json["Profile"] is NSNull ? nil : (json["Profile"] as? Dictionary<String, Any>)!
            let profileEntity = ProfileEntity(
                UpdatedDate:    dicProfile!["UpdatedDate"] is NSNull ? 0 : (dicProfile!["UpdatedDate"] as? Int)!,
                CreatedDate:    dicProfile!["CreatedDate"] is NSNull ? 0 : (dicProfile!["CreatedDate"] as? Int)!,
                CardTerm:       dicProfile!["CardTerm"] is NSNull ? "" : (dicProfile!["CardTerm"] as? String)!,
                BankAccNumber:  dicProfile!["BankAccNumber"] is NSNull ? "" : (dicProfile!["BankAccNumber"] as? String)!,
                IdImage1:       dicProfile!["IdImage1"] is NSNull ? "" : (dicProfile!["IdImage1"] as? String)!,
                Address:        dicProfile!["Address"] is NSNull ? "" : (dicProfile!["Address"] as? String)!,
                IdNumber:       dicProfile!["IdNumber"] is NSNull ? "" : (dicProfile!["IdNumber"] as? String)!,
                DateOfBirth:    dicProfile!["DateOfBirth"] is NSNull ? "" : (dicProfile!["DateOfBirth"] as? String)!,
                Fullname:       dicProfile!["Fullname"] is NSNull ? "" : (dicProfile!["Fullname"] as? String)!,
                Username:       dicProfile!["Username"] is NSNull ? "" : (dicProfile!["Username"] as? String)!,
                Id:             dicProfile!["Id"] is NSNull ? 0 : (dicProfile!["Id"] as? Int)!
            )
            let updateProfileResultEntity = UpdateProfileResultEntity(
                Profile:    profileEntity,
                Message:    json["Message"] is NSNull ? "" : (json["Message"] as? String)!,
                StatusCode: json["StatusCode"] is NSNull ? 0 : (json["StatusCode"] as? Int)!
            )
            completion(updateProfileResultEntity)
        }
    }
    
}
