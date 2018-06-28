//
//  CameraView.swift
//  1-Score
//
//  Created by TIMA on 6/28/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIViewController {

    var cameraPresenter:CameraPresenterProtocol?
    
    var captureSession = AVCaptureSession()
    var backCamera:AVCaptureDevice?
    var frontCamera:AVCaptureDevice?
    var currentCamera:AVCaptureDevice?
    
    var photoOutput:AVCapturePhotoOutput?
    
    var cameraPreviewLayer:AVCaptureVideoPreviewLayer?
    
    var btCapture:UIButton = UIButton()
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        addButtonCapture()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addButtonCapture() {
        let sizeButtonCapture = UIScreen.main.bounds.width / 6
        view.addSubview(btCapture)
        btCapture.translatesAutoresizingMaskIntoConstraints = false
        btCapture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btCapture.widthAnchor.constraint(equalToConstant: sizeButtonCapture).isActive = true
        btCapture.heightAnchor.constraint(equalToConstant: sizeButtonCapture).isActive = true
        btCapture.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -sizeButtonCapture/2).isActive = true
        btCapture.bounds.size = CGSize(width: sizeButtonCapture, height: sizeButtonCapture)
        btCapture.setImage(#imageLiteral(resourceName: "ic_capture"), for: .normal)
        btCapture.imageContentMode = 1
        btCapture.addTarget(self, action: #selector(actionCapture), for: .touchUpInside)
    }
    
    func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    func setupDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        let devices = deviceDiscoverySession.devices
        
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        currentCamera = backCamera
    }
    
    func setupInputOutput() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            captureSession.addOutput(photoOutput!)
        } catch {
            
        }
    }
    
    func setupPreviewLayer() {
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame = self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
    }
    
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    @objc func actionCapture(sender:UIButton!) {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }

}

extension CameraView : AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            print(imageData)
            image = UIImage(data: imageData)
//            dismiss(animated: true, completion: nil)
            dismiss(animated: true) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "modalIsDimissed"), object: nil, userInfo: ["image":self.image ?? #imageLiteral(resourceName: "avatar")])
            }
        }
    }
    
}

extension CameraView : CameraViewProtocol {
    
}
