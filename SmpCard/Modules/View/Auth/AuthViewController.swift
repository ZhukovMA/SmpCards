//
//  AuthViewController.swift
//  SmpCard
//
//  Created by Максим Жуков on 01.01.2021.
//  Copyright © 2021 SMP. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    var viewModel: AuthViewModelType? {
        didSet {
            
        }
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = UIFont(name: "Verdana", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль:"
        label.font = UIFont(name: "Verdana", size: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "password"
        textField.delegate = self
        
        textField.textColor = #colorLiteral(red: 0.7256766558, green: 0.7213647366, blue: 0.7289925218, alpha: 1)
        textField.autocapitalizationType = .none
        textField.font = UIFont(name: "Verdana", size: 18)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин:"
        label.font = UIFont(name: "Verdana", size: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var  loginTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.keyboardType = .emailAddress
        textField.delegate = self
        
        textField.autocapitalizationType = .none
        textField.placeholder = "myBrigade@example.com"
        textField.textColor = #colorLiteral(red: 0.7256766558, green: 0.7213647366, blue: 0.7289925218, alpha: 1)
        
        textField.font = UIFont(name: "Verdana", size: 18)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(push), for: .touchDown)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 22)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Забыл(а) пароль", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(forgotPassword), for: .touchDown)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Зарегистрировать бригаду", for: .normal)
        button.addTarget(self, action: #selector(register), for: .touchDown)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func forgotPassword() {
        print(1)
    }
    
    @objc func register() {
        print(1)
    }
    
    let singInActivityView: ActivityView = {
        let activityView = ActivityView(withText: "Вход")
        return activityView
    }()
    
    @objc func push() {
        view.addSubview(singInActivityView.view)
        singInActivityView.view.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        singInActivityView.view.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        viewModel?.signIn(email: loginTextField.text ?? "", password: passwordTextField.text ?? "") { (result) in
            switch result {
            case .success(_):
                let mainController = MainTableViewContoller()
                mainController.viewModel = MainViewModel()
                let navController = UINavigationController(rootViewController: mainController)
                if let statusBarFrame  = self.view.window?.windowScene?.statusBarManager?.statusBarFrame {
                    let statusBarView = UIView(frame: statusBarFrame)
                    statusBarView.backgroundColor = #colorLiteral(red: 0.09766118973, green: 0.09708828479, blue: 0.09810651094, alpha: 1)
                    navController.view.addSubview(statusBarView)
                }
                UIApplication.shared.windows.first?.rootViewController = navController
                self.singInActivityView.view.removeFromSuperview()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    let authView: UIView = {
        let av = UIView()
        av.translatesAutoresizingMaskIntoConstraints = false
        return av
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerLabel)
        view.addSubview(self.authView)
        authView.addSubview(self.loginLabel)
        authView.addSubview(self.loginTextField)
        authView.addSubview(self.passwordLabel)
        authView.addSubview(self.passwordTextField)
        view.addSubview(self.signInButton)
//        view.addSubview(self.forgotPasswordButton)
//        view.addSubview(self.signUpButton)
//        
        
        view.backgroundColor = #colorLiteral(red: 0.1298618913, green: 0.131595701, blue: 0.1584605277, alpha: 1)
        
        
        headerLabel.bottomAnchor.constraint(equalTo: authView.topAnchor, constant: -50).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        authView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        authView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        authView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        loginLabel.topAnchor.constraint(equalTo: authView.topAnchor).isActive = true
        loginLabel.leftAnchor.constraint(equalTo: loginTextField.leftAnchor).isActive = true
        loginLabel.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -3).isActive = true
        
        loginTextField.bottomAnchor.constraint(equalTo: authView.centerYAnchor, constant: -10).isActive = true
        loginTextField.leftAnchor.constraint(equalTo: authView.leftAnchor).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: authView.rightAnchor).isActive = true
        
        passwordLabel.topAnchor.constraint(equalTo: authView.centerYAnchor, constant: 10).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: authView.leftAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 3).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: authView.leftAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: authView.rightAnchor).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: authView.bottomAnchor).isActive = true
        
        signInButton.topAnchor.constraint(equalTo: authView.bottomAnchor, constant: 30).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        forgotPasswordButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30).isActive = true
//        forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
//        signUpButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20).isActive = true
//        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
  
}

extension AuthViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
