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
    
    func getProfile(completion: @escaping (UpdateProfileResultEntity) -> ()) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                let profileEntity = ProfileEntity(
                    UpdatedDate:    data.value(forKey: "updatedDate") as? Int,
                    CreatedDate:    data.value(forKey: "createdDate") as? Int,
                    CardTerm:       data.value(forKey: "cardTerm") as? String,
                    BankAccNumber:  data.value(forKey: "bankAccNumber") as? String,
                    IdImage1:       data.value(forKey: "idImage1") as? String,
                    Address:        data.value(forKey: "address") as? String,
                    IdNumber:       data.value(forKey: "idNumber") as? String,
                    DateOfBirth:    data.value(forKey: "dateOfBirth") as? String,
                    Fullname:       data.value(forKey: "fullname") as? String,
                    Username:       data.value(forKey: "username") as? String,
                    Id:             data.value(forKey: "id") as? Int
                )
                let updateProfileResultEntity = UpdateProfileResultEntity(
                    Profile: profileEntity,
                    Message:        data.value(forKey: "message") as? String,
                    StatusCode:     data.value(forKey: "statusCode") as? Int
                )
                completion(updateProfileResultEntity)
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
    
    func updateProfileToDB(updateProfileEntity: UpdateProfileEntity) {
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
                if(user == updateProfileEntity.username) {
                    managedContext.delete(managedObjectData)
                }
            }
            
            let profileEntity = NSEntityDescription.entity(forEntityName: "Profile", in: managedContext)!
            let profile = NSManagedObject(entity: profileEntity, insertInto: managedContext)
            profile.setValue(updateProfileEntity.address ?? "", forKey: "address")
            profile.setValue(updateProfileEntity.bank_acc_number ?? "", forKey: "bankAccNumber")
            profile.setValue(updateProfileEntity.card_term ?? "", forKey: "cardTerm")
            profile.setValue(updateProfileEntity.date_of_birth ?? "", forKey: "dateOfBirth")
            profile.setValue(updateProfileEntity.fullname ?? "", forKey: "fullname")
            profile.setValue(updateProfileEntity.id_card_image ?? 0, forKey: "idCardImage")
            profile.setValue(updateProfileEntity.id_image_1 ?? 0, forKey: "idImage1")
            profile.setValue(updateProfileEntity.id_image_2 ?? 0, forKey: "idImage2")
            profile.setValue(updateProfileEntity.id_number ?? "", forKey: "idNumber")
            profile.setValue(updateProfileEntity.sex ?? 0, forKey: "sex")
            profile.setValue(updateProfileEntity.username ?? "", forKey: "username")
            
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
