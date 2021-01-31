//
//  ChangePasswordViewController.swift
//  citizen-helper
//
//  Created by art-off on 01.02.2021.
//

import UIKit


protocol ChangePasswordViewControllerProtocol: BaseViewControllerProtocol {
    var presenter: ChangePasswordPresenterProtocol? { get }
}


class ChangePasswordViewController: BaseViewController {
    
    var presenter: ChangePasswordPresenterProtocol?
    
    private let textFieldsStackView = CommonUIHelper.textFieldsStackView()
    private var oldPasswordView: UIView!
    private var oldPasswordTextFiled: UITextField!
    private var newPasswordView: UIView!
    private var newPasswordTextFiled: UITextField!
    
    private var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Изменить пароль"
        
        setupTextFields()
        setupButton()
    }
    
    private func setupTextFields() {
        view.addSubview(textFieldsStackView)
        textFieldsStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        let (oWrapView, oTextField) = CommonUIHelper.roundedTextFiled()
        oldPasswordTextFiled = oTextField
        oldPasswordTextFiled.placeholder = "Старый пароль"
        oldPasswordTextFiled.isSecureTextEntry = true
        
        let (nWrapView, nTextField) = CommonUIHelper.roundedTextFiled()
        newPasswordTextFiled = nTextField
        newPasswordTextFiled.placeholder = "Новый пароль"
        newPasswordTextFiled.isSecureTextEntry = true
        
        oWrapView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        nWrapView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        textFieldsStackView.addArrangedSubview(oWrapView)
        textFieldsStackView.addArrangedSubview(nWrapView)
    }
    
    private func setupButton() {
        doneButton = CommonUIHelper.button(with: "Изменить")
        
        view.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldsStackView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        doneButton.addTarget(self, action: #selector(didTapDoneButton), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func didTapDoneButton() {
        presenter?.changePassword(oldPassword: oldPasswordTextFiled.text ?? "", newPassword: newPasswordTextFiled.text ?? "")
    }
    
}

extension ChangePasswordViewController: ChangePasswordViewControllerProtocol { }
