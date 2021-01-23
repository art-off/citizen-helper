//
//  AuthViewController.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import UIKit
import SnapKit

protocol AuthViewControllerProtocol: BaseViewControllerProtocol {
    var presenter: AuthPresenterProtocol? { get set }
}

class AuthViewController: BaseViewController {
    
    var presenter: AuthPresenterProtocol?
    
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let titleLabel = AuthUIHelper.titleLabel()
    private let emblemImageView = AuthUIHelper.emblemImageView()
    
    private let textFieldsStackView = AuthUIHelper.textFieldsStackView()
    private var emailTextField: UITextField!
    private var passwordTextFiled: UITextField!
    
    private let signInButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupScrollView()
        
        setupTitleLabel()
        setupEmblem()
        setupTextFields()
        setupSignInButton()
        setupRegistrationButton()
        
        
        addGestureRecongizerToHideKeyboard()
        addHideShowKeyboardRecognizers()
    }
    
    // MARK: - Setup Views
    private func setupScrollView() {
        view.addSubview(scrollView)
        // убираем полосы прокрутки
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view)
        }
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(20)
        }
        titleLabel.text = "Вход"
        titleLabel.textColor = .gray
    }
    
    private func setupEmblem() {
        contentView.addSubview(emblemImageView)
        emblemImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(130)
        }
    }
    
    private func setupTextFields() {
        contentView.addSubview(textFieldsStackView)
        textFieldsStackView.snp.makeConstraints { make in
            make.top.equalTo(emblemImageView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        textFieldsStackView.backgroundColor = .clear
        
        let (eWrapView, eTextField) = AuthUIHelper.roundedTextFiled()
        emailTextField = eTextField
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        
        let (pWrapView, pTextField) = AuthUIHelper.roundedTextFiled()
        passwordTextFiled = pTextField
        passwordTextFiled.placeholder = "Пароль"
        passwordTextFiled.isSecureTextEntry = true
        
        eWrapView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        pWrapView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        textFieldsStackView.addArrangedSubview(eWrapView)
        textFieldsStackView.addArrangedSubview(pWrapView)
    }
    
    private func setupSignInButton() {
        contentView.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldsStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        signInButton.setTitle("Войти", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        signInButton.backgroundColor = .systemGray2
        signInButton.layer.cornerRadius = 10
        signInButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    }
    
    private func setupRegistrationButton() {
        contentView.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.setTitleColor(.gray, for: .normal)
        registrationButton.addTarget(self, action: #selector(didTapRegistrationButton), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func didTapSignInButton() {
        presenter?.signIn(email: emailTextField.text ?? "", password: passwordTextFiled.text ?? "")
    }
    
    @objc
    private func didTapRegistrationButton() {
        presenter?.onSelectRegister()
    }
    
    private func addGestureRecongizerToHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }

    
    // MARK: - Methods For Notification
    private func addHideShowKeyboardRecognizers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        guard var keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 50
        scrollView.contentInset = contentInset
    }

    @objc
    private func keyboardWillHide(notification:NSNotification) {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
}

extension AuthViewController: AuthViewControllerProtocol { }
