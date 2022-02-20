//
//  LoginVC.swift
//  bnc-ios-latihan
//
//  Created by Muhamad Taufiq Ramadhan on 18/02/22.
//

import Foundation
import UIKit

class LoginVC: BaseViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var labelError: UILabel!
    
    private var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePresenter()
        configureObserver()
        configureView()
    }
    
    private func configurePresenter() {
        presenter = LoginPresenter(view: self)
    }
    
    private func configureObserver() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(emailValidation),
            name: UITextField.textDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(passwordValidation),
            name: UITextField.textDidChangeNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(checkVisibility),
            name: UITextField.textDidChangeNotification,
            object: nil
        )
    }
    
    private func configureView() {
        view.setupToolbar(textfield: textFieldEmail)
        view.setupToolbar(textfield: textFieldPassword)
        spinner.isHidden = true
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        presenter.retrieveData(email: textFieldEmail.text ?? "", password: textFieldPassword.text ?? "")
    }
    
}

//MARK: - Form Validation
extension LoginVC {
    @objc private func emailValidation() -> Bool {
        if textFieldEmail.text?.isValidEmail() == true {
            labelError.isHidden = true
            return true
        } else {
            labelError.isHidden = false
            labelError.text = "\(textFieldEmail.text ?? "") is not a valid email address"
            return false
        }
    }
    
    @objc private func passwordValidation() -> Bool {
        if textFieldPassword.text?.isEmpty == false {
            labelError.isHidden = true
            return true
        } else {
            return false
        }
    }
    
    @objc private func checkVisibility() {
        if emailValidation() && passwordValidation() {
            buttonLogin.isEnabled = true
        } else {
            buttonLogin.isEnabled = false
        }
    }
}

//MARK: - Callback
extension LoginVC: LoginPresenterProtocol {
    func startLoading() {
        spinner.startAnimating()
        spinner.isHidden = false
        buttonLogin.isEnabled = false
    }
    
    func finishLoading() {
        spinner.stopAnimating()
        spinner.isHidden = true
        buttonLogin.isEnabled = true
    }
    
    func setErrorMessage(_ message: String) {
        View.instance.showAlert(self, message: message)
    }
    
    func whenSuccess(_ data: LoginModel) {
        View.instance.pushViewController(self, to: BottomNavigationVC(), {
            self.textFieldEmail.text = ""
            self.textFieldPassword.text = ""
            UserDefault.token.value = data.token
            UserDefault.loggedIn.value = true
        }, style: .fullScreen)
    }
}
