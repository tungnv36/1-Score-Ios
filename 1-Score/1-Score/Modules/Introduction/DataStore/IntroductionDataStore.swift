//
//  IntroductionDataStore.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import CoreData

class IntroductionDataStore : IntroductionDataStoreProtocol {
    
    func updateConfig(introductionEntity:IntroductionEntity) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Config")
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
            
            let configEntity = NSEntityDescription.entity(forEntityName: "Config", in: managedContext)!
            let config = NSManagedObject(entity: configEntity, insertInto: managedContext)
            config.setValue(introductionEntity.showIntro, forKeyPath: "showIntro")
            
            try managedContext.save()
        } catch {
            print("Delete all data")
        }
    }
    
}
