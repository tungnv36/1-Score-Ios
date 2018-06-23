//
//  OtpView.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class OtpView: UIViewController {

    var otpPresenter:OtpPresenterProtocol?
    
    var mainView:UIView = UIView()
    
    var txtOtp:UITextField = UITextField()
    var lblDescription:UILabel = UILabel()
    var ivLogo:UIImageView = UIImageView()
    var btConfirm:UIButton = UIButton()
    var btBack:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupComponent()
    }

    func setupComponent() {
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        mainView.bounds.size = UIScreen.main.bounds.size
//        mainView.backgroundColor = UIColor.red
        
        //add button back
        mainView.addSubview(btBack)
        btBack.translatesAutoresizingMaskIntoConstraints = false
        btBack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        btBack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30).isActive = true
        btBack.widthAnchor.constraint(equalToConstant: 20).isActive = true
        btBack.heightAnchor.constraint(equalToConstant: 20).isActive = true
        btBack.bounds.size = CGSize(width: 20, height: 20)
        btBack.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        mainView.addSubview(txtOtp)
        txtOtp.translatesAutoresizingMaskIntoConstraints = false
        txtOtp.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        txtOtp.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        txtOtp.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        txtOtp.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtOtp.bounds.size.height = 40
        txtOtp.placeholder = "Nhập OTP"
        txtOtp.autocorrectionType = .no
        txtOtp.layer.masksToBounds = true
        txtOtp.layer.borderWidth = 1
        txtOtp.layer.borderColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue).cgColor
        txtOtp.layer.cornerRadius = 5
        txtOtp.textAlignment = .center
        
        mainView.addSubview(lblDescription)
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: txtOtp.topAnchor, constant: -20).isActive = true
        lblDescription.numberOfLines = 0
        lblDescription.textAlignment = .center
        lblDescription.text = StringEnum.LBL_DES_OTP.rawValue
        lblDescription.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue)
        
        mainView.addSubview(ivLogo)
        ivLogo.translatesAutoresizingMaskIntoConstraints = false
        ivLogo.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        ivLogo.bottomAnchor.constraint(equalTo: lblDescription.topAnchor, constant: -30).isActive = true
        ivLogo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3).isActive = true;
        ivLogo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/3).isActive = true;
        ivLogo.bounds.size = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
        ivLogo.image = #imageLiteral(resourceName: "logo")
        ivLogo.contentMode = .scaleAspectFit
        
        let heightButton:CGFloat = 55
        mainView.addSubview(btConfirm)
        btConfirm.translatesAutoresizingMaskIntoConstraints = false
        btConfirm.topAnchor.constraint(equalTo: txtOtp.bottomAnchor, constant: 30).isActive = true
        btConfirm.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 50).isActive = true
        btConfirm.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -50).isActive = true
        btConfirm.heightAnchor.constraint(equalToConstant: heightButton).isActive = true
        btConfirm.bounds.size.height = heightButton
        
        btConfirm.setTitle(StringEnum.LBL_LOGIN.rawValue, for: .normal)
        btConfirm.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: UIScreen.main.bounds.width - 100,
            h: btConfirm.bounds.height,
            cornerRadius: btConfirm.bounds.height / 2
        )
        btConfirm.dropShadow(btConfirm.bounds.height / 2)
        btConfirm.addTarget(self, action: #selector(actionConfirm), for: .touchUpInside)
    }
    
    @objc func back(sender:UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionConfirm(sender:UIButton!) {
        otpPresenter?.goToAuthenticOtp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension OtpView : OtpViewProtocol {
    
}
