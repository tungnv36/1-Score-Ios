//
//  Utils.swift
//  1-Score
//
//  Created by TIMA on 6/29/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    static func cropToBounds(image: UIImage, rateScene: CGFloat) -> UIImage {
        
        let cgimage = image.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = 0.0
        var cgheight: CGFloat = 0.0
        
        if contextSize.width > contextSize.height {
            let newHeight:CGFloat = contextSize.width / rateScene
            let rateWH:CGFloat = contextSize.height / newHeight
            posX = ((contextSize.width - newHeight) / 2)
            posY = (contextSize.height - contextSize.height/rateWH)/2
            cgwidth = newHeight
            cgheight = newHeight
        } else {
            let newWidth:CGFloat = contextSize.height / rateScene
            let rateWH:CGFloat = contextSize.width / newWidth
            posX = (contextSize.width - contextSize.width/rateWH)/2
            posY = ((contextSize.height - newWidth) / 2)
            cgwidth = newWidth
            cgheight = newWidth
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    
    static func convertImageToBase64(image: UIImage) -> String {
        let imageData = UIImagePNGRepresentation(image)!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    
    static func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
    static func getImageType(type:Int) -> String {
        switch type {
        case 1:
            return "CMND_FRONT"
        case 2:
            return "CMND_BACK"
        case 3:
            return "ATM_CARD"
        default:
            return ""
        }
    }
    
}
