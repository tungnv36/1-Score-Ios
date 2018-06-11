//
//  LoginView.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class RegisterView: UIViewController {
    
    var registerPresenter:RegisterPresenterProtocol?
    
    var mainStackView:UIStackView = UIStackView()
    var viewBanner:UIView = UIView()
    var viewRegister:UIView = UIView()
    
    var ibBack:UIButton = UIButton()
    var ivLogo:UIImageView = UIImageView()
    var lblUser:UILabel = UILabel()
    var lblPass:UILabel = UILabel()
    var lblRePass:UILabel = UILabel()
    var lblEmail:UILabel = UILabel()
    var txtUser:UITextField = UITextField()
    var txtPass:UITextField = UITextField()
    var txtRePass:UITextField = UITextField()
    var txtEmail:UITextField = UITextField()
    var btLostPass:UIButton = UIButton()
    var ivIconUser:UIImageView = UIImageView()
    var ivIconPass:UIImageView = UIImageView()
    var ivIconEmail:UIImageView = UIImageView()
    var btLogin:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainStackView()
        addBanner()
        addViewRegister()
        addLoginButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    
    @objc func keyboardWillAppear(_ notification: NSNotification) {
        if let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let inset = keyboardFrame.height
            
            let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
            viewRegister.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - inset).isActive = true
        }
    }
    
    @objc func keyboardWillDisappear(_ notification: NSNotification) {
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewRegister.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - 30).isActive = true
    }
    
    func addMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStackView.bounds.size = UIScreen.main.bounds.size
    }
    
    func addBanner() {
        mainStackView.addArrangedSubview(viewBanner)
        viewBanner.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor).isActive = true
        viewBanner.topAnchor.constraint(equalTo: mainStackView.topAnchor).isActive = true
        viewBanner.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewBanner.heightAnchor.constraint(equalToConstant: heightBanner).isActive = true
        viewBanner.bounds.size.height = heightBanner
        
        viewBanner.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_MEDIUM.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 0.0, y: 1.0),
            w: UIScreen.main.bounds.width,
            h: heightBanner,
            cornerRadius: 0
        )
        
        viewBanner.addSubview(ibBack)
        ibBack.translatesAutoresizingMaskIntoConstraints = false
        ibBack.leadingAnchor.constraint(equalTo: viewBanner.leadingAnchor, constant: 10).isActive = true
        ibBack.topAnchor.constraint(equalTo: viewBanner.topAnchor, constant: 30).isActive = true
        ibBack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        ibBack.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ibBack.bounds.size.height = 30
        ibBack.bounds.size.width = 30
        ibBack.setImage(#imageLiteral(resourceName: "ic_back"), for: .normal)
        ibBack.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        
        viewBanner.addSubview(ivLogo)
        ivLogo.translatesAutoresizingMaskIntoConstraints = false
        ivLogo.centerXAnchor.constraint(equalTo: viewBanner.centerXAnchor).isActive = true
        ivLogo.topAnchor.constraint(equalTo: viewBanner.topAnchor, constant: UIScreen.main.bounds.width / 4).isActive = true
        ivLogo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        ivLogo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        ivLogo.bounds.size = CGSize(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
        ivLogo.image = #imageLiteral(resourceName: "logo")
        ivLogo.contentMode = .scaleAspectFit
    }
    
    func addViewRegister() {
        let heightTextField:CGFloat = 35
        let sizeIcon:CGFloat = 20
        //Add view login
        mainStackView.addSubview(viewRegister)
        viewRegister.translatesAutoresizingMaskIntoConstraints = false
        viewRegister.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30).isActive = true
        viewRegister.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30).isActive = true
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewRegister.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - 30).isActive = true
        viewRegister.backgroundColor = UIColor.white
        viewRegister.dropShadow(10)
        
        //Add label user
        viewRegister.addSubview(lblUser)
        lblUser.translatesAutoresizingMaskIntoConstraints = false
        lblUser.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20).isActive = true
        lblUser.topAnchor.constraint(equalTo: viewRegister.topAnchor, constant: 20).isActive = true
        lblUser.text = StringEnum.LBL_USER.rawValue
        lblUser.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblUser.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add textfield user
        viewRegister.addSubview(txtUser)
        txtUser.translatesAutoresizingMaskIntoConstraints = false
        txtUser.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20).isActive = true
        txtUser.trailingAnchor.constraint(equalTo: viewRegister.trailingAnchor, constant: -20).isActive = true
        txtUser.topAnchor.constraint(equalTo: lblUser.bottomAnchor).isActive = true
        txtUser.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtUser.frame.size.height = heightTextField
        txtUser.setBottomBorder()
        txtUser.autocorrectionType = .no
        txtUser.keyboardType = .phonePad
        
        //Add icon user
        viewRegister.addSubview(ivIconUser)
        ivIconUser.translatesAutoresizingMaskIntoConstraints = false
        ivIconUser.centerYAnchor.constraint(equalTo: txtUser.centerYAnchor).isActive = true
        ivIconUser.trailingAnchor.constraint(equalTo: txtUser.trailingAnchor, constant: -10).isActive = true
        ivIconUser.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconUser.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconUser.image = #imageLiteral(resourceName: "ic_user")
        ivIconUser.contentMode = .scaleAspectFit
        
        //Add label pass
        viewRegister.addSubview(lblPass)
        lblPass.translatesAutoresizingMaskIntoConstraints = false
        lblPass.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20).isActive = true
        lblPass.topAnchor.constraint(equalTo: txtUser.bottomAnchor, constant: 10).isActive = true
        lblPass.text = StringEnum.LBL_PASS.rawValue
        lblPass.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblPass.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add text field pass
        viewRegister.addSubview(txtPass)
        txtPass.translatesAutoresizingMaskIntoConstraints = false
        txtPass.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20).isActive = true
        txtPass.trailingAnchor.constraint(equalTo: viewRegister.trailingAnchor, constant: -20).isActive = true
        txtPass.topAnchor.constraint(equalTo: lblPass.bottomAnchor).isActive = true
        txtPass.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtPass.frame.size.height = heightTextField
        txtPass.setBottomBorder()
        txtPass.isSecureTextEntry = true
        
        //Add icon pass
        viewRegister.addSubview(ivIconPass)
        ivIconPass.translatesAutoresizingMaskIntoConstraints = false
        ivIconPass.centerYAnchor.constraint(equalTo: txtPass.centerYAnchor).isActive = true
        ivIconPass.trailingAnchor.constraint(equalTo: txtPass.trailingAnchor, constant: -10).isActive = true
        ivIconPass.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconPass.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconPass.image = #imageLiteral(resourceName: "ic_pass")
        ivIconPass.contentMode = .scaleAspectFit
        
        //Add label re-pass
        viewRegister.addSubview(lblRePass)
        lblRePass.translatesAutoresizingMaskIntoConstraints = false
        lblRePass.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20).isActive = true
        lblRePass.topAnchor.constraint(equalTo: txtPass.bottomAnchor, constant: 10).isActive = true
        lblRePass.text = StringEnum.LBL_REPASS.rawValue
        lblRePass.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblRePass.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add text field re-pass
        viewRegister.addSubview(txtRePass)
        txtRePass.translatesAutoresizingMaskIntoConstraints = false
        txtRePass.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20).isActive = true
        txtRePass.trailingAnchor.constraint(equalTo: viewRegister.trailingAnchor, constant: -20).isActive = true
        txtRePass.topAnchor.constraint(equalTo: lblRePass.bottomAnchor).isActive = true
        txtRePass.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtRePass.frame.size.height = heightTextField
        txtRePass.setBottomBorder()
        txtRePass.isSecureTextEntry = true
        
        //Add label email
        viewRegister.addSubview(lblEmail)
        lblEmail.translatesAutoresizingMaskIntoConstraints = false
        lblEmail.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20).isActive = true
        lblEmail.topAnchor.constraint(equalTo: txtRePass.bottomAnchor, constant: 10).isActive = true
        lblEmail.text = StringEnum.LBL_EMAIL.rawValue
        lblEmail.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblEmail.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add textfield email
        viewRegister.addSubview(txtEmail)
        txtEmail.translatesAutoresizingMaskIntoConstraints = false
        txtEmail.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20).isActive = true
        txtEmail.trailingAnchor.constraint(equalTo: viewRegister.trailingAnchor, constant: -20).isActive = true
        txtEmail.topAnchor.constraint(equalTo: lblEmail.bottomAnchor).isActive = true
        txtEmail.bottomAnchor.constraint(equalTo: viewRegister.bottomAnchor, constant: -20).isActive = true
        txtEmail.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtEmail.frame.size.height = heightTextField
        txtEmail.setBottomBorder()
        txtEmail.autocorrectionType = .no
        txtEmail.keyboardType = .emailAddress
        
        //Add icon email
        viewRegister.addSubview(ivIconEmail)
        ivIconEmail.translatesAutoresizingMaskIntoConstraints = false
        ivIconEmail.centerYAnchor.constraint(equalTo: txtEmail.centerYAnchor).isActive = true
        ivIconEmail.trailingAnchor.constraint(equalTo: txtEmail.trailingAnchor, constant: -10).isActive = true
        ivIconEmail.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconEmail.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconEmail.image = #imageLiteral(resourceName: "ic_email")
        ivIconEmail.contentMode = .scaleAspectFit
    }
    
    func addLoginButton() {
        let heightButton:CGFloat = 55
        mainStackView.addSubview(btLogin)
        btLogin.translatesAutoresizingMaskIntoConstraints = false
        btLogin.topAnchor.constraint(equalTo: viewRegister.bottomAnchor, constant: 30).isActive = true
        btLogin.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 50).isActive = true
        btLogin.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -50).isActive = true
        btLogin.heightAnchor.constraint(equalToConstant: heightButton).isActive = true
        btLogin.bounds.size.height = heightButton
        
        btLogin.setTitle(StringEnum.LBL_REGISTER.rawValue, for: .normal)
        btLogin.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: UIScreen.main.bounds.width - 100,
            h: btLogin.bounds.height,
            cornerRadius: btLogin.bounds.height / 2
        )
        btLogin.dropShadow(btLogin.bounds.height / 2)
        btLogin.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
    }
    
    @objc func actionBack(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionLogin(sender: UIButton!) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension RegisterView : RegisterViewProtocol {
    
}
