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
    
    func saveImageToLocal(fineName: String, image: UIImage) {
        
    }
    
    func saveImageToDB(uploadImageResultEntity: UploadImageResultEntity, imageName: String, username: String, type: String) {
        
    }
    
    func uploadImage(token: String, uploadImageEntity: UploadImageEntity, completion: @escaping (UploadImageResultEntity) -> ()) {
        _homePageApi.uploadImage(token: token, uploadImageEntity: uploadImageEntity)  { (json : [String : Any]) in
            print(json)
            let dicImage = json["Image"] is NSNull ? nil : (json["Image"] as? Dictionary<String, Any>)!
            let imageEntity = ImageEntity(
                imageType:  dicImage!["ImageType"] is NSNull ? "" : (dicImage!["ImageType"] as? String)!,
                url:        dicImage!["Url"] is NSNull ? "" : (dicImage!["Url"] as? String)!,
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
