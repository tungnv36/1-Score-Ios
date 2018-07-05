//
//  AuthenticOtpView.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class AuthenticOtpView: UIViewController {

    var authenticOtpPresenter:AuthenticOtpPresenterProtocol?
    var mainView:UIView = UIView()
    
    var txtOtp1:UITextField = UITextField()
    var txtOtp2:UITextField = UITextField()
    var txtOtp3:UITextField = UITextField()
    var txtOtp4:UITextField = UITextField()
    var txtOtp5:UITextField = UITextField()
    var txtOtp6:UITextField = UITextField()
    var lblDescription:UILabel = UILabel()
    var ivLogo:UIImageView = UIImageView()
    var btConfirm:UIButton = UIButton()
    var btBack:UIButton = UIButton()
    
    let spacingTextfield:CGFloat = 10
    var type:Int?//1:quên mk, 2: đăng ký
    var phoneNumber:String?
    
    convenience init() {
        self.init(type: nil, phoneNumber: nil)
    }
    
    init(type: Int?, phoneNumber: String?) {
        self.type = type
        self.phoneNumber = phoneNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        setupComponent()
    }
    
    func setupComponent() {
        let wTxtOtp:CGFloat = (UIScreen.main.bounds.width - 40 - 5 * spacingTextfield)/6
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //add button back
        mainView.addSubview(btBack)
        btBack.translatesAutoresizingMaskIntoConstraints = false
        btBack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        btBack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 30).isActive = true
        btBack.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btBack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btBack.bounds.size = CGSize(width: 30, height: 30)
        btBack.setImage(#imageLiteral(resourceName: "ios_back_gray"), for: .normal)
        btBack.addTarget(self, action: #selector(back), for: .touchUpInside)
        btBack.imageContentMode = 1
        
        mainView.addSubview(txtOtp1)
        txtOtp1.translatesAutoresizingMaskIntoConstraints = false
        txtOtp1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        txtOtp1.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        txtOtp1.widthAnchor.constraint(equalToConstant: wTxtOtp).isActive = true
        txtOtp1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtOtp1.bounds.size = CGSize(width: wTxtOtp, height: 40)
        txtOtp1.keyboardType = .numberPad
        txtOtp1.autocorrectionType = .no
        txtOtp1.layer.masksToBounds = true
        txtOtp1.layer.borderWidth = 1
        txtOtp1.layer.borderColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue).cgColor
        txtOtp1.layer.cornerRadius = 5
        txtOtp1.textAlignment = .center
        txtOtp1.addTarget(self, action: #selector(otp1DidChange(_:)), for: UIControlEvents.editingChanged)
        
        mainView.addSubview(txtOtp2)
        txtOtp2.translatesAutoresizingMaskIntoConstraints = false
        txtOtp2.leadingAnchor.constraint(equalTo: txtOtp1.trailingAnchor, constant: spacingTextfield).isActive = true
        txtOtp2.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        txtOtp2.widthAnchor.constraint(equalToConstant: wTxtOtp).isActive = true
        txtOtp2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtOtp2.bounds.size = CGSize(width: wTxtOtp, height: 40)
        txtOtp2.keyboardType = .numberPad
        txtOtp2.autocorrectionType = .no
        txtOtp2.layer.masksToBounds = true
        txtOtp2.layer.borderWidth = 1
        txtOtp2.layer.borderColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue).cgColor
        txtOtp2.layer.cornerRadius = 5
        txtOtp2.textAlignment = .center
        txtOtp2.addTarget(self, action: #selector(otp2DidChange(_:)), for: UIControlEvents.editingChanged)
        
        mainView.addSubview(txtOtp3)
        txtOtp3.translatesAutoresizingMaskIntoConstraints = false
        txtOtp3.leadingAnchor.constraint(equalTo: txtOtp2.trailingAnchor, constant: spacingTextfield).isActive = true
        txtOtp3.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        txtOtp3.widthAnchor.constraint(equalToConstant: wTxtOtp).isActive = true
        txtOtp3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtOtp3.bounds.size = CGSize(width: wTxtOtp, height: 40)
        txtOtp3.keyboardType = .numberPad
        txtOtp3.autocorrectionType = .no
        txtOtp3.layer.masksToBounds = true
        txtOtp3.layer.borderWidth = 1
        txtOtp3.layer.borderColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue).cgColor
        txtOtp3.layer.cornerRadius = 5
        txtOtp3.textAlignment = .center
        txtOtp3.addTarget(self, action: #selector(otp3DidChange(_:)), for: UIControlEvents.editingChanged)
        
        mainView.addSubview(txtOtp4)
        txtOtp4.translatesAutoresizingMaskIntoConstraints = false
        txtOtp4.leadingAnchor.constraint(equalTo: txtOtp3.trailingAnchor, constant: spacingTextfield).isActive = true
        txtOtp4.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        txtOtp4.widthAnchor.constraint(equalToConstant: wTxtOtp).isActive = true
        txtOtp4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtOtp4.bounds.size = CGSize(width: wTxtOtp, height: 40)
        txtOtp4.keyboardType = .numberPad
        txtOtp4.autocorrectionType = .no
        txtOtp4.layer.masksToBounds = true
        txtOtp4.layer.borderWidth = 1
        txtOtp4.layer.borderColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue).cgColor
        txtOtp4.layer.cornerRadius = 5
        txtOtp4.textAlignment = .center
        txtOtp4.addTarget(self, action: #selector(otp4DidChange(_:)), for: UIControlEvents.editingChanged)
        
        mainView.addSubview(txtOtp5)
        txtOtp5.translatesAutoresizingMaskIntoConstraints = false
        txtOtp5.leadingAnchor.constraint(equalTo: txtOtp4.trailingAnchor, constant: spacingTextfield).isActive = true
        txtOtp5.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        txtOtp5.widthAnchor.constraint(equalToConstant: wTxtOtp).isActive = true
        txtOtp5.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtOtp5.bounds.size = CGSize(width: wTxtOtp, height: 40)
        txtOtp5.keyboardType = .numberPad
        txtOtp5.autocorrectionType = .no
        txtOtp5.layer.masksToBounds = true
        txtOtp5.layer.borderWidth = 1
        txtOtp5.layer.borderColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue).cgColor
        txtOtp5.layer.cornerRadius = 5
        txtOtp5.textAlignment = .center
        txtOtp5.addTarget(self, action: #selector(otp5DidChange(_:)), for: UIControlEvents.editingChanged)
        
        mainView.addSubview(txtOtp6)
        txtOtp6.translatesAutoresizingMaskIntoConstraints = false
        txtOtp6.leadingAnchor.constraint(equalTo: txtOtp5.trailingAnchor, constant: spacingTextfield).isActive = true
        txtOtp6.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        txtOtp6.widthAnchor.constraint(equalToConstant: wTxtOtp).isActive = true
        txtOtp6.heightAnchor.constraint(equalToConstant: 40).isActive = true
        txtOtp6.bounds.size = CGSize(width: wTxtOtp, height: 40)
        txtOtp6.keyboardType = .numberPad
        txtOtp6.autocorrectionType = .no
        txtOtp6.layer.masksToBounds = true
        txtOtp6.layer.borderWidth = 1
        txtOtp6.layer.borderColor = UIColor.rgb(fromHex: ColorEnum.TEXT_MEDIUM.rawValue).cgColor
        txtOtp6.layer.cornerRadius = 5
        txtOtp6.textAlignment = .center
        txtOtp6.addTarget(self, action: #selector(otp6DidChange(_:)), for: UIControlEvents.editingChanged)
        
        mainView.addSubview(lblDescription)
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        lblDescription.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: txtOtp1.topAnchor, constant: -20).isActive = true
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
        btConfirm.topAnchor.constraint(equalTo: txtOtp1.bottomAnchor, constant: 30).isActive = true
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
        if(type == 1) {// change pass
            let otpCode = txtOtp1.text! + txtOtp2.text! + txtOtp3.text! + txtOtp4.text! + txtOtp5.text! + txtOtp6.text!
            authenticOtpPresenter?.changePass(phoneNumber: phoneNumber!, otpCode: otpCode, action: StringEnum.ACTION_FORGOT_PASSWORD.rawValue, type: type!)
        } else {// register
            let otpCode = txtOtp1.text! + txtOtp2.text! + txtOtp3.text! + txtOtp4.text! + txtOtp5.text! + txtOtp6.text!
            authenticOtpPresenter?.compareOtp(phoneNumber: phoneNumber!, otpCode: otpCode, action: StringEnum.ACTION_CONFIRM_USER.rawValue, type: type!)
        }
    }
    
    @objc func otp1DidChange(_ textField: UITextField) {
        txtOtp2.becomeFirstResponder()
    }
    
    @objc func otp2DidChange(_ textField: UITextField) {
        txtOtp3.becomeFirstResponder()
    }
    
    @objc func otp3DidChange(_ textField: UITextField) {
        txtOtp4.becomeFirstResponder()
    }
    
    @objc func otp4DidChange(_ textField: UITextField) {
        txtOtp5.becomeFirstResponder()
    }
    
    @objc func otp5DidChange(_ textField: UITextField) {
        txtOtp6.becomeFirstResponder()
    }
    
    @objc func otp6DidChange(_ textField: UITextField) {
        
    }

}

extension AuthenticOtpView : AuthenticOtpViewProtocol {
    
    func compareOtpFailed(err: String) {
        let alert = UIAlertController(title: "Thông báo!", message: err, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
