//
//  MainProtocol.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

//View
protocol HomePageViewProtocol : class {
    func initData(loginEntity:LoginResultEntity)
    
    func saveImageToLocalSuccess(image:UIImage)
    func saveImageToLocalError(err:String)
}
//Presenter
protocol HomePagePresenterProtocol : class {
    var view: HomePageViewProtocol? { get set }
    var interactor: HomePageInteractorInputProtocol? { get set }
    var wireframe: HomePageWireframeProtocol? { get set }
    
    func initData()
    func goToProfile()
    func goToLoanRequest()
    func goToSetting()
    func goToCamera()
    
    func updateImage(type:Int, imageType:Int, image:UIImage);
}
//Interactor
protocol HomePageInteractorInputProtocol : class {
    var presenter:HomePageInteractorOutputProtocol? { get set }
    var dataStore:HomePageDataStoreProtocol? { get set }
    
    func initData()
    func goToProfile()
    func goToLoanRequest()
    func goToSetting()
    func goToCamera()
    
    func updateImage(type:Int, imageType:Int, image:UIImage);
}

protocol HomePageInteractorOutputProtocol : class {
    func goToProfileOutput()
    func goToLoanRequestOutput()
    func goToSettingOutput()
    
    func initDataOutput(loginEntity:LoginResultEntity)
    func goToCameraOutput()
    
    func saveImageToLocalSuccess(image:UIImage)
    func saveImageToLocalError(err:String)
}
//Wireframe
protocol HomePageWireframeProtocol : class {
    static func getModule() -> UIViewController
    func goToProfile(view: HomePageViewProtocol)
    func goToLoanRequest(view: HomePageViewProtocol)
    func goToSetting(view: HomePageViewProtocol)
    func goToCamera(view: HomePageViewProtocol)
}
//DataStore
protocol HomePageDataStoreProtocol : class {
    func getUser(completion:@escaping (_ loginResultEntity:LoginResultEntity) -> ())
    func saveImageToLocal(fineName:String, image:UIImage)
    func saveImageToDB(uploadImageResultEntity:UploadImageResultEntity, imageName:String, username:String, type:String)
    func uploadImage(token:String, uploadImageEntity:UploadImageEntity, completion:@escaping (_ uploadImageResultEntity: UploadImageResultEntity) -> ())
}
