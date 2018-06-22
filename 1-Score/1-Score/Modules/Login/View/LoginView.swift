//
//  LoginView.swift
//  1-Score
//
//  Created by TIMA on 6/11/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    var loginPresenter:LoginPresenterProtocol?
    
    var mainStackView:UIStackView = UIStackView()
    var viewBanner:UIView = UIView()
    var viewLogin:UIView = UIView()
    
    var ibBack:UIButton = UIButton()
    var ivLogo:UIImageView = UIImageView()
    var lblUser:UILabel = UILabel()
    var lblPass:UILabel = UILabel()
    var txtUser:UITextField = UITextField()
    var txtPass:UITextField = UITextField()
    var btLostPass:UIButton = UIButton()
    var ivIconUser:UIImageView = UIImageView()
    var ivIconPass:UIImageView = UIImageView()
    var btLogin:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainStackView()
        addBanner()
        addViewLogin()
        addLoginButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        txtUser.text = "0987654321"
        txtPass.text = "123456"
    }
    
    @objc func keyboardWillAppear(_ notification: NSNotification) {
        if let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let inset = keyboardFrame.height
            
            let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
            viewLogin.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - inset + 50).isActive = true
        }
    }
    
    @objc func keyboardWillDisappear(_ notification: NSNotification) {
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewLogin.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - 30).isActive = true
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
    
    func addViewLogin() {
        let heightTextField:CGFloat = 35
        let sizeIcon:CGFloat = 20
        //Add view login
        mainStackView.addSubview(viewLogin)
        viewLogin.translatesAutoresizingMaskIntoConstraints = false
        viewLogin.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30).isActive = true
        viewLogin.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30).isActive = true
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewLogin.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - 30).isActive = true
        viewLogin.backgroundColor = UIColor.white
        viewLogin.dropShadow(10)
        
        //Add label user
        viewLogin.addSubview(lblUser)
        lblUser.translatesAutoresizingMaskIntoConstraints = false
        lblUser.leadingAnchor.constraint(equalTo: viewLogin.leadingAnchor, constant: 20).isActive = true
        lblUser.topAnchor.constraint(equalTo: viewLogin.topAnchor, constant: 20).isActive = true
        lblUser.text = StringEnum.LBL_USER.rawValue
        lblUser.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblUser.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add textfield user
        viewLogin.addSubview(txtUser)
        txtUser.translatesAutoresizingMaskIntoConstraints = false
        txtUser.leadingAnchor.constraint(equalTo: viewLogin.leadingAnchor, constant: 20).isActive = true
        txtUser.trailingAnchor.constraint(equalTo: viewLogin.trailingAnchor, constant: -20).isActive = true
        txtUser.topAnchor.constraint(equalTo: lblUser.bottomAnchor).isActive = true
        txtUser.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtUser.frame.size.height = heightTextField
        txtUser.setBottomBorder()
        txtUser.autocorrectionType = .no
        txtUser.keyboardType = .phonePad
        
        //Add icon user
        viewLogin.addSubview(ivIconUser)
        ivIconUser.translatesAutoresizingMaskIntoConstraints = false
        ivIconUser.centerYAnchor.constraint(equalTo: txtUser.centerYAnchor).isActive = true
        ivIconUser.trailingAnchor.constraint(equalTo: txtUser.trailingAnchor, constant: -10).isActive = true
        ivIconUser.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconUser.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconUser.image = #imageLiteral(resourceName: "ic_user")
        ivIconUser.contentMode = .scaleAspectFit
        
        //Add label pass
        viewLogin.addSubview(lblPass)
        lblPass.translatesAutoresizingMaskIntoConstraints = false
        lblPass.leadingAnchor.constraint(equalTo: viewLogin.leadingAnchor, constant: 20).isActive = true
        lblPass.topAnchor.constraint(equalTo: txtUser.bottomAnchor, constant: 10).isActive = true
        lblPass.text = StringEnum.LBL_PASS.rawValue
        lblPass.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblPass.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add text field pass
        viewLogin.addSubview(txtPass)
        txtPass.translatesAutoresizingMaskIntoConstraints = false
        txtPass.leadingAnchor.constraint(equalTo: viewLogin.leadingAnchor, constant: 20).isActive = true
        txtPass.trailingAnchor.constraint(equalTo: viewLogin.trailingAnchor, constant: -20).isActive = true
        txtPass.topAnchor.constraint(equalTo: lblPass.bottomAnchor).isActive = true
        txtPass.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtPass.frame.size.height = heightTextField
        txtPass.setBottomBorder()
        txtPass.isSecureTextEntry = true
        
        //Add icon pass
        viewLogin.addSubview(ivIconPass)
        ivIconPass.translatesAutoresizingMaskIntoConstraints = false
        ivIconPass.centerYAnchor.constraint(equalTo: txtPass.centerYAnchor).isActive = true
        ivIconPass.trailingAnchor.constraint(equalTo: txtPass.trailingAnchor, constant: -10).isActive = true
        ivIconPass.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconPass.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconPass.image = #imageLiteral(resourceName: "ic_pass")
        ivIconPass.contentMode = .scaleAspectFit
        
        //Add lost pass button
        viewLogin.addSubview(btLostPass)
        btLostPass.translatesAutoresizingMaskIntoConstraints = false
        btLostPass.leadingAnchor.constraint(equalTo: viewLogin.leadingAnchor, constant: 20).isActive = true
        btLostPass.topAnchor.constraint(equalTo: txtPass.bottomAnchor, constant: 10).isActive = true
        btLostPass.bottomAnchor.constraint(equalTo: viewLogin.bottomAnchor, constant: -20).isActive = true
        btLostPass.setTitle(StringEnum.BTN_LOST_PASS.rawValue, for: .normal)
        btLostPass.setTitleColor(UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue), for: .normal)
        btLostPass.titleLabel?.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 14)
        btLostPass.addTarget(self, action: #selector(forgotPass), for: .touchUpInside)
    }
    
    func addLoginButton() {
        let heightButton:CGFloat = 55
        mainStackView.addSubview(btLogin)
        btLogin.translatesAutoresizingMaskIntoConstraints = false
        btLogin.topAnchor.constraint(equalTo: viewLogin.bottomAnchor, constant: 50).isActive = true
        btLogin.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 50).isActive = true
        btLogin.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -50).isActive = true
        btLogin.heightAnchor.constraint(equalToConstant: heightButton).isActive = true
        btLogin.bounds.size.height = heightButton
        
        btLogin.setTitle(StringEnum.LBL_LOGIN.rawValue, for: .normal)
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
        loginPresenter?.login(username: txtUser.text!, password: txtPass.text!)
    }

    @objc func forgotPass(sender: UIButton!) {
        loginPresenter?.goToOtp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension LoginView : LoginViewProtocol {
    
    func userEmpty(msg: String) {
        let alert = UIAlertController(title: "Thông báo!", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func passEmpty(msg: String) {
        let alert = UIAlertController(title: "Thông báo!", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func loginFailed(err:String) {
        let alert = UIAlertController(title: "Thông báo!", message: err, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
