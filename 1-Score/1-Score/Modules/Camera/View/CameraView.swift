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
    
    var topView:UIView = UIView()
    var bottomView:UIView = UIView()
    var leftView:UIView = UIView()
    var rightView:UIView = UIView()
    
    var wCamera:CGFloat = 0.0;
    var hCamera:CGFloat = 0.0;
    var leftCamera:CGFloat = 0.0;
    var topCamera:CGFloat = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
        drawRect()
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
        currentCamera = frontCamera
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
    
    func drawRect() {
        wCamera = UIScreen.main.bounds.width
        hCamera = UIScreen.main.bounds.width
        topCamera = (UIScreen.main.bounds.height - hCamera)/2// - 50
        
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: topCamera).isActive = true
        topView.bounds.size.height = (UIScreen.main.bounds.height - hCamera)/2
        topView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.topAnchor.constraint(equalTo: view.topAnchor, constant: topCamera + hCamera).isActive = true
        bottomView.backgroundColor = UIColor(white: 0, alpha: 0.5)
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
            image = Utils.cropToBounds(image: UIImage(data: imageData)!, rateScene: view.bounds.height/view.bounds.width)
            dismiss(animated: true) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "modalIsDimissed"), object: nil, userInfo: ["image":self.image ?? #imageLiteral(resourceName: "avatar")])
            }
        }
    }
    
}

extension CameraView : CameraViewProtocol {
    
}
