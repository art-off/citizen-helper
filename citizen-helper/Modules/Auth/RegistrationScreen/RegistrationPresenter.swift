//
//  RegistrationPresenter.swift
//  citizen-helper
//
//  Created by art-off on 23.01.2021.
//

import Foundation

protocol RegistrationPresenterDelegate: AnyObject {
    func dismisRegistrationScreen()
    func showMainScreen()
}


protocol RegistrationPresenterProtocol {
    func register(surname: String, firstName: String, middleName: String, address: String, email: String, password: String)
    func onTapClose()
}

class RegistrationPresenter {
    
    private weak var controller: RegistrationViewControllerProtocol?
    private weak var delegate: RegistrationPresenterDelegate?
    
    private let authService = AuthService()
    
    init(controller: RegistrationViewControllerProtocol, delegate: RegistrationPresenterDelegate) {
        self.controller = controller
        self.delegate = delegate
    }
    
}

extension RegistrationPresenter: RegistrationPresenterProtocol {
    
    func register(surname: String, firstName: String, middleName: String, address: String, email: String, password: String) {
        guard !surname.isEmpty, !firstName.isEmpty, !email.isEmpty, !password.isEmpty else {
            controller?.showAlert(with: "Не все необходимые поля заполнены")
            return
        }
        
        if let emailError = validate(email: email) {
            controller?.showAlert(with: emailError.description)
            return
        }
        
        if let passwordError = validate(password: password) {
            controller?.showAlert(with: passwordError.description)
            return
        }
        
        controller?.startLoagingAnimation()
        let fio = surname + " " + firstName + (!middleName.isEmpty ? " \(middleName)" : "")
        let optionalAddress = !address.isEmpty ? address : nil
        authService.registration(
            user: User(fio: fio, email: email, address: optionalAddress),
            with: password,
            completion: { result in
                switch result {
                case .success():
                    DispatchQueue.main.async {
                        self.controller?.stopLoagingAnimation()
                        self.delegate?.showMainScreen()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.controller?.stopLoagingAnimation()
                        self.controller?.showAlert(with: error.description)
                    }
                }
            }
        )
    }
    
    func onTapClose() {
        delegate?.dismisRegistrationScreen()
    }
    
}

private extension RegistrationPresenter {
    
    func validate(email: String) -> APIError? {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format: "SELF MATCHES %@", regularExpressionForEmail)
        if testEmail.evaluate(with: email) {
            return nil
        } else {
            return .invalidEmail
        }
     }
    
    func validate(password: String) -> APIError? {
        if password.count < 8 {
            return .passwordTooShort
        }
        if password.rangeOfCharacter(from: NSCharacterSet.letters) == nil {
            return .passwordEntirelyNumeric
        }
        return nil
    }
    
}
