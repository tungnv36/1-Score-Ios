//
//  ChangePassView.swift
//  1-Score
//
//  Created by TIMA on 6/23/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class ChangePassView: UIViewController {

    var changePassPresenter:ChangePassPresenterProtocol?
    
    var mainStackView:UIStackView = UIStackView()
    var viewBanner:UIView = UIView()
    var viewChangePass:UIView = UIView()
    
    var ibBack:UIButton = UIButton()
    var ivLogo:UIImageView = UIImageView()
    var lblPass:UILabel = UILabel()
    var lblRePass:UILabel = UILabel()
    var txtPass:UITextField = UITextField()
    var txtRePass:UITextField = UITextField()
    var ivIconPass:UIImageView = UIImageView()
    var btChangePass:UIButton = UIButton()
    
    var phoneNumber:String?
    var token:String?
    
    convenience init() {
        self.init(phoneNumber: nil, token: nil)
    }
    
    init(phoneNumber: String?, token: String?) {
        self.phoneNumber = phoneNumber
        self.token = token
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainStackView()
        addBanner()
        addviewChangePass()
        addLoginButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }
    
    @objc func keyboardWillAppear(_ notification: NSNotification) {
        if let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let inset = keyboardFrame.height
            
            let heightBanner:CGFloat = 12 * UIScreen.main.bounds.height / 20
            viewChangePass.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - inset).isActive = true
        }
    }
    
    @objc func keyboardWillDisappear(_ notification: NSNotification) {
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewChangePass.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - 30).isActive = true
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
    
    func addviewChangePass() {
        let heightTextField:CGFloat = 35
        let sizeIcon:CGFloat = 20
        //Add view login
        mainStackView.addSubview(viewChangePass)
        viewChangePass.translatesAutoresizingMaskIntoConstraints = false
        viewChangePass.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30).isActive = true
        viewChangePass.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30).isActive = true
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewChangePass.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - 30).isActive = true
        viewChangePass.backgroundColor = UIColor.red
        viewChangePass.dropShadow(10)
        
        //Add label pass
        viewChangePass.addSubview(lblPass)
        lblPass.translatesAutoresizingMaskIntoConstraints = false
        lblPass.leadingAnchor.constraint(equalTo: viewChangePass.leadingAnchor, constant: 20).isActive = true
        lblPass.topAnchor.constraint(equalTo: viewChangePass.topAnchor, constant: 20).isActive = true
        lblPass.text = StringEnum.LBL_PASS.rawValue
        lblPass.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblPass.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add text field pass
        viewChangePass.addSubview(txtPass)
        txtPass.translatesAutoresizingMaskIntoConstraints = false
        txtPass.leadingAnchor.constraint(equalTo: viewChangePass.leadingAnchor, constant: 20).isActive = true
        txtPass.trailingAnchor.constraint(equalTo: viewChangePass.trailingAnchor, constant: -20).isActive = true
        txtPass.topAnchor.constraint(equalTo: lblPass.bottomAnchor).isActive = true
        txtPass.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtPass.frame.size.height = heightTextField
        txtPass.setBottomBorder()
        txtPass.isSecureTextEntry = true
        
        //Add icon pass
        viewChangePass.addSubview(ivIconPass)
        ivIconPass.translatesAutoresizingMaskIntoConstraints = false
        ivIconPass.centerYAnchor.constraint(equalTo: txtPass.centerYAnchor).isActive = true
        ivIconPass.trailingAnchor.constraint(equalTo: txtPass.trailingAnchor, constant: -10).isActive = true
        ivIconPass.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconPass.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconPass.image = #imageLiteral(resourceName: "ic_pass")
        ivIconPass.contentMode = .scaleAspectFit
        
        //Add label re-pass
        viewChangePass.addSubview(lblRePass)
        lblRePass.translatesAutoresizingMaskIntoConstraints = false
        lblRePass.leadingAnchor.constraint(equalTo: viewChangePass.leadingAnchor, constant: 20).isActive = true
        lblRePass.topAnchor.constraint(equalTo: txtPass.bottomAnchor, constant: 10).isActive = true
        lblRePass.text = StringEnum.LBL_REPASS.rawValue
        lblRePass.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblRePass.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add text field re-pass
        viewChangePass.addSubview(txtRePass)
        txtRePass.translatesAutoresizingMaskIntoConstraints = false
        txtRePass.leadingAnchor.constraint(equalTo: viewChangePass.leadingAnchor, constant: 20).isActive = true
        txtRePass.trailingAnchor.constraint(equalTo: viewChangePass.trailingAnchor, constant: -20).isActive = true
        txtRePass.topAnchor.constraint(equalTo: lblRePass.bottomAnchor).isActive = true
        txtRePass.bottomAnchor.constraint(equalTo: viewChangePass.bottomAnchor, constant: -10).isActive = true
        txtRePass.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtRePass.frame.size.height = heightTextField
        txtRePass.setBottomBorder()
        txtRePass.isSecureTextEntry = true
    }
    
    func addLoginButton() {
        let heightButton:CGFloat = 55
        mainStackView.addSubview(btChangePass)
        btChangePass.translatesAutoresizingMaskIntoConstraints = false
        btChangePass.topAnchor.constraint(equalTo: viewChangePass.bottomAnchor, constant: 30).isActive = true
        btChangePass.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 50).isActive = true
        btChangePass.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -50).isActive = true
        btChangePass.heightAnchor.constraint(equalToConstant: heightButton).isActive = true
        btChangePass.bounds.size.height = heightButton
        
        btChangePass.setTitle(StringEnum.LBL_CHANGE_PASS.rawValue, for: .normal)
        btChangePass.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: UIScreen.main.bounds.width - 100,
            h: btChangePass.bounds.height,
            cornerRadius: btChangePass.bounds.height / 2
        )
        btChangePass.dropShadow(btChangePass.bounds.height / 2)
        btChangePass.addTarget(self, action: #selector(actionChangePass), for: .touchUpInside)
    }
    
    @objc func actionBack(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionChangePass(sender: UIButton!) {
        changePassPresenter?.changePass(userName: phoneNumber!, newPass: txtPass.text!, rePass: txtRePass.text!, token: token!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ChangePassView : ChangePassViewProtocol {
    
    func changePassSuccess(msg:String) {
        let alert = UIAlertController(title: "Thông báo!", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.changePassPresenter?.goToLogin()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func changePassFailed(err:String) {
        let alert = UIAlertController(title: "Thông báo!", message: err, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
