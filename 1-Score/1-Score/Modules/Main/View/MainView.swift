//
//  MainView.swift
//  1-Score
//
//  Created by TIMA on 6/10/18.
//  Copyright © 2018 TIMA. All rights reserved.
//

import UIKit

class MainView: UIViewController {

    var mainPresenter : MainPresenterProtocol?
    
    var mainStackView:UIStackView = UIStackView()
    var logoStackView:UIStackView = UIStackView()
    
    var ivLogo:UIImageView = UIImageView()
    var btLogin:UIButton = UIButton()
    var btRegister:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        addMainStackView()
        addLogo()
        addButton()
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
    
    func addLogo() {
        mainStackView.addArrangedSubview(logoStackView)
        logoStackView.translatesAutoresizingMaskIntoConstraints = false
        logoStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor).isActive = true
        logoStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor).isActive = true
        logoStackView.topAnchor.constraint(equalTo: mainStackView.topAnchor).isActive = true
        logoStackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2).isActive = true
        logoStackView.bounds.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        
        logoStackView.addSubview(ivLogo)
        ivLogo.translatesAutoresizingMaskIntoConstraints = false
        ivLogo.centerXAnchor.constraint(equalTo: logoStackView.centerXAnchor).isActive = true
        ivLogo.topAnchor.constraint(equalTo: logoStackView.topAnchor, constant: UIScreen.main.bounds.width / 3.5).isActive = true
        ivLogo.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.5).isActive = true
        ivLogo.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.5).isActive = true
        ivLogo.bounds.size = CGSize(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)
        
        ivLogo.image = #imageLiteral(resourceName: "logo")
        ivLogo.contentMode = .scaleAspectFit
    }
    
    func addButton() {
        mainStackView.addSubview(btLogin)
        btLogin.translatesAutoresizingMaskIntoConstraints = false
        btLogin.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: UIScreen.main.bounds.height / 2).isActive = true
        btLogin.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 50).isActive = true
        btLogin.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -50).isActive = true
        btLogin.heightAnchor.constraint(equalToConstant: 55).isActive = true
        btLogin.bounds.size.height = 55
        
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
        
        mainStackView.addSubview(btRegister)
        btRegister.translatesAutoresizingMaskIntoConstraints = false
        btRegister.topAnchor.constraint(equalTo: btLogin.bottomAnchor, constant: 15).isActive = true
        btRegister.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 50).isActive = true
        btRegister.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -50).isActive = true
        btRegister.heightAnchor.constraint(equalToConstant: 55).isActive = true
        btRegister.bounds.size.height = 55
        
        btRegister.setTitle(StringEnum.LBL_REGISTER.rawValue, for: .normal)
        btRegister.setTitleColor(UIColor.rgb(fromHex: ColorEnum.TEXT_DARK.rawValue), for: .normal)
        btRegister.titleLabel?.font = UIFont(name: StringEnum.MAIN_FONT.rawValue, size: 16)
        btRegister.backgroundColor = UIColor.white
        btRegister.dropShadow(btRegister.bounds.height / 2)
        btRegister.addTarget(self, action: #selector(actionRegister), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func actionLogin(sender: UIButton!) {
        print("LOGIN")
        mainPresenter?.goToLogin()
    }
    
    @objc func actionRegister(sender: UIButton!) {
        print("REGISTER")
        mainPresenter?.goToRegister()
    }
    
}

extension MainView : MainViewProtocol {
    
}
