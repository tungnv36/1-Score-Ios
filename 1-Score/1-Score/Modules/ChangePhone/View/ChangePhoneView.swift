//
//  ChangePhoneView.swift
//  1-Score
//
//  Created by TIMA on 6/22/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class ChangePhoneView: UIViewController {

    var changePhonePresenter:ChangePhonePresenterProtocol?
    
    var mainStackView:UIStackView = UIStackView()
    var viewBanner:UIView = UIView()
    var viewChangePhone:UIView = UIView()
    
    var ibBack:UIButton = UIButton()
    var ivLogo:UIImageView = UIImageView()
    var lblOldPhone:UILabel = UILabel()
    var lblNewPhone:UILabel = UILabel()
    var lblPass:UILabel = UILabel()
    var txtOldPhone:UITextField = UITextField()
    var txtNewPhone:UITextField = UITextField()
    var txtPass:UITextField = UITextField()
    var ivIconOldPhone:UIImageView = UIImageView()
    var ivIconNewPhone:UIImageView = UIImageView()
    var ivIconPass:UIImageView = UIImageView()
    var btChangePhone:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainStackView()
        addBanner()
        addviewChangePhone()
        addLoginButton()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        changePhonePresenter?.initOldPhone()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func keyboardWillAppear(_ notification: NSNotification) {
        if let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let inset = keyboardFrame.height
            
            let heightBanner:CGFloat = 10 * UIScreen.main.bounds.height / 20
            viewChangePhone.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - inset).isActive = true
        }
    }
    
    @objc func keyboardWillDisappear(_ notification: NSNotification) {
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewChangePhone.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - 30).isActive = true
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
    
    func addviewChangePhone() {
        let heightTextField:CGFloat = 35
        let sizeIcon:CGFloat = 20
        //Add view change phone
        mainStackView.addSubview(viewChangePhone)
        viewChangePhone.translatesAutoresizingMaskIntoConstraints = false
        viewChangePhone.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 30).isActive = true
        viewChangePhone.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -30).isActive = true
        let heightBanner:CGFloat = 8.7 * UIScreen.main.bounds.height / 20
        viewChangePhone.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: heightBanner - 30).isActive = true
        viewChangePhone.backgroundColor = UIColor.white
        viewChangePhone.dropShadow(10)
        
        //Add label old phone
        viewChangePhone.addSubview(lblOldPhone)
        lblOldPhone.translatesAutoresizingMaskIntoConstraints = false
        lblOldPhone.leadingAnchor.constraint(equalTo: viewChangePhone.leadingAnchor, constant: 20).isActive = true
        lblOldPhone.topAnchor.constraint(equalTo: viewChangePhone.topAnchor, constant: 20).isActive = true
        lblOldPhone.text = StringEnum.LBL_USER.rawValue
        lblOldPhone.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblOldPhone.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add textfield old phone
        viewChangePhone.addSubview(txtOldPhone)
        txtOldPhone.translatesAutoresizingMaskIntoConstraints = false
        txtOldPhone.leadingAnchor.constraint(equalTo: viewChangePhone.leadingAnchor, constant: 20).isActive = true
        txtOldPhone.trailingAnchor.constraint(equalTo: viewChangePhone.trailingAnchor, constant: -20).isActive = true
        txtOldPhone.topAnchor.constraint(equalTo: lblOldPhone.bottomAnchor).isActive = true
        txtOldPhone.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtOldPhone.frame.size.height = heightTextField
        txtOldPhone.setBottomBorder()
        txtOldPhone.autocorrectionType = .no
        txtOldPhone.keyboardType = .phonePad
        txtOldPhone.isUserInteractionEnabled = false
        
        //Add icon old phone
        viewChangePhone.addSubview(ivIconOldPhone)
        ivIconOldPhone.translatesAutoresizingMaskIntoConstraints = false
        ivIconOldPhone.centerYAnchor.constraint(equalTo: txtOldPhone.centerYAnchor).isActive = true
        ivIconOldPhone.trailingAnchor.constraint(equalTo: txtOldPhone.trailingAnchor, constant: -10).isActive = true
        ivIconOldPhone.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconOldPhone.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconOldPhone.image = #imageLiteral(resourceName: "ic_user")
        ivIconOldPhone.contentMode = .scaleAspectFit
        
        //Add label old phone
        viewChangePhone.addSubview(lblNewPhone)
        lblNewPhone.translatesAutoresizingMaskIntoConstraints = false
        lblNewPhone.leadingAnchor.constraint(equalTo: viewChangePhone.leadingAnchor, constant: 20).isActive = true
        lblNewPhone.topAnchor.constraint(equalTo: txtOldPhone.bottomAnchor, constant: 10).isActive = true
        lblNewPhone.text = StringEnum.LBL_USER.rawValue
        lblNewPhone.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblNewPhone.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add textfield old phone
        viewChangePhone.addSubview(txtNewPhone)
        txtNewPhone.translatesAutoresizingMaskIntoConstraints = false
        txtNewPhone.leadingAnchor.constraint(equalTo: viewChangePhone.leadingAnchor, constant: 20).isActive = true
        txtNewPhone.trailingAnchor.constraint(equalTo: viewChangePhone.trailingAnchor, constant: -20).isActive = true
        txtNewPhone.topAnchor.constraint(equalTo: lblNewPhone.bottomAnchor).isActive = true
        txtNewPhone.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtNewPhone.frame.size.height = heightTextField
        txtNewPhone.setBottomBorder()
        txtNewPhone.autocorrectionType = .no
        txtNewPhone.keyboardType = .phonePad
        
        //Add icon old phone
        viewChangePhone.addSubview(ivIconNewPhone)
        ivIconNewPhone.translatesAutoresizingMaskIntoConstraints = false
        ivIconNewPhone.centerYAnchor.constraint(equalTo: txtNewPhone.centerYAnchor).isActive = true
        ivIconNewPhone.trailingAnchor.constraint(equalTo: txtNewPhone.trailingAnchor, constant: -10).isActive = true
        ivIconNewPhone.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconNewPhone.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconNewPhone.image = #imageLiteral(resourceName: "ic_user")
        ivIconNewPhone.contentMode = .scaleAspectFit
        
        //Add label pass
        viewChangePhone.addSubview(lblPass)
        lblPass.translatesAutoresizingMaskIntoConstraints = false
        lblPass.leadingAnchor.constraint(equalTo: viewChangePhone.leadingAnchor, constant: 20).isActive = true
        lblPass.topAnchor.constraint(equalTo: txtNewPhone.bottomAnchor, constant: 10).isActive = true
        lblPass.text = StringEnum.LBL_PASS.rawValue
        lblPass.textColor = UIColor.rgb(fromHex: ColorEnum.TEXT_LIGHT.rawValue)
        lblPass.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        
        //Add text field pass
        viewChangePhone.addSubview(txtPass)
        txtPass.translatesAutoresizingMaskIntoConstraints = false
        txtPass.leadingAnchor.constraint(equalTo: viewChangePhone.leadingAnchor, constant: 20).isActive = true
        txtPass.trailingAnchor.constraint(equalTo: viewChangePhone.trailingAnchor, constant: -20).isActive = true
        txtPass.topAnchor.constraint(equalTo: lblPass.bottomAnchor).isActive = true
        txtPass.bottomAnchor.constraint(equalTo: viewChangePhone.bottomAnchor, constant: -10).isActive = true
        txtPass.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        txtPass.frame.size.height = heightTextField
        txtPass.setBottomBorder()
        txtPass.isSecureTextEntry = true
        
        //Add icon pass
        viewChangePhone.addSubview(ivIconPass)
        ivIconPass.translatesAutoresizingMaskIntoConstraints = false
        ivIconPass.centerYAnchor.constraint(equalTo: txtPass.centerYAnchor).isActive = true
        ivIconPass.trailingAnchor.constraint(equalTo: txtPass.trailingAnchor, constant: -10).isActive = true
        ivIconPass.widthAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconPass.heightAnchor.constraint(equalToConstant: sizeIcon).isActive = true
        ivIconPass.image = #imageLiteral(resourceName: "ic_pass")
        ivIconPass.contentMode = .scaleAspectFit
    }
    
    func addLoginButton() {
        let heightButton:CGFloat = 55
        mainStackView.addSubview(btChangePhone)
        btChangePhone.translatesAutoresizingMaskIntoConstraints = false
        btChangePhone.topAnchor.constraint(equalTo: viewChangePhone.bottomAnchor, constant: 30).isActive = true
        btChangePhone.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 50).isActive = true
        btChangePhone.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -50).isActive = true
        btChangePhone.heightAnchor.constraint(equalToConstant: heightButton).isActive = true
        btChangePhone.bounds.size.height = heightButton
        
        btChangePhone.setTitle(StringEnum.LBL_CHANGE_PHONE.rawValue, for: .normal)
        btChangePhone.applyGradient(
            colours: [
                UIColor.rgb(fromHex: ColorEnum.BLUE_LIGHT.rawValue),
                UIColor.rgb(fromHex: ColorEnum.BLUE_DARK.rawValue)
            ],
            startPoint: CGPoint(x: 0.0, y: 0.0),
            endPoint: CGPoint(x: 1.0, y: 0.0),
            w: UIScreen.main.bounds.width - 100,
            h: btChangePhone.bounds.height,
            cornerRadius: btChangePhone.bounds.height / 2
        )
        btChangePhone.dropShadow(btChangePhone.bounds.height / 2)
        btChangePhone.addTarget(self, action: #selector(actionChangePhone), for: .touchUpInside)
    }
    
    @objc func actionBack(sender: UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionChangePhone(sender: UIButton!) {
        changePhonePresenter?.changePhone(oldPhone: txtOldPhone.text!, newPhone: txtNewPhone.text!, password: txtPass.text!)
    }

}

extension ChangePhoneView : ChangePhoneViewProtocol {
    
    func initOldPhone(oldPhone:String) {
        txtOldPhone.text = oldPhone
    }
    
    func changePhoneSuccess(msg:String) {
        let alert = UIAlertController(title: "Thông báo!", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func changePhoneFailed(err:String) {
        let alert = UIAlertController(title: "Thông báo!", message: err, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
