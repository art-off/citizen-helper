//
//  RegistrationViewController.swift
//  citizen-helper
//
//  Created by art-off on 23.01.2021.
//

import UIKit

protocol RegistrationViewControllerProtocol: BaseViewControllerProtocol {
    var presenter: RegistrationPresenterProtocol? { get set }
}

class RegistrationViewController: BaseViewController {
    
    var presenter: RegistrationPresenterProtocol?
    
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.setImage(UIImage(systemName: "xmark.circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.tintColor = .gray
        return button
    }()
    private let titleLabel = AuthUIHelper.titleLabel()
    
    private let textFieldsStackView = AuthUIHelper.textFieldsStackView()
    private var surnameTextField: UITextField!
    private var firstNameTextField: UITextField!
    private var middleNameTextFiled: UITextField!
    private var addressTextField: UITextField!
    private var emailTextField: UITextField!
    private var passwordTextFiled: UITextField!
    
    private let registrationButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupScrollView()
        
        setupTitleLabel()
        setupCloseButton()
        setupTextFields()
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
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        titleLabel.text = "Регистрация"
        titleLabel.textColor = .gray
    }
    
    private func setupCloseButton() {
        contentView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalTo(titleLabel)
            make.size.equalTo(30)
        }
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    }
    
    private func setupTextFields() {
        contentView.addSubview(textFieldsStackView)
        textFieldsStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        textFieldsStackView.backgroundColor = .clear
        
        let (sWparView, sTextField) = AuthUIHelper.roundedTextFiled()
        surnameTextField = sTextField
        surnameTextField.placeholder = "Фамилия"
        surnameTextField.keyboardType = .alphabet
        surnameTextField.autocorrectionType = .no
        
        let (fnWparView, fnTextField) = AuthUIHelper.roundedTextFiled()
        firstNameTextField = fnTextField
        firstNameTextField.placeholder = "Имя"
        firstNameTextField.keyboardType = .alphabet
        firstNameTextField.autocorrectionType = .no
        
        let (mnWparView, mnTextField) = AuthUIHelper.roundedTextFiled()
        middleNameTextFiled = mnTextField
        middleNameTextFiled.placeholder = "Отчество (не обязательно)"
        middleNameTextFiled.keyboardType = .alphabet
        middleNameTextFiled.autocorrectionType = .no
        
        let (aWparView, aTextField) = AuthUIHelper.roundedTextFiled()
        addressTextField = aTextField
        addressTextField.placeholder = "Адрес проживания (не обязательно)"
        addressTextField.autocorrectionType = .no
        
        let (eWrapView, eTextField) = AuthUIHelper.roundedTextFiled()
        emailTextField = eTextField
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        
        let (pWrapView, pTextField) = AuthUIHelper.roundedTextFiled()
        passwordTextFiled = pTextField
        passwordTextFiled.placeholder = "Пароль"
        passwordTextFiled.isSecureTextEntry = true
        
        sWparView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        fnWparView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        mnWparView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        aWparView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        eWrapView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        pWrapView.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        textFieldsStackView.addArrangedSubview(sWparView)
        textFieldsStackView.addArrangedSubview(fnWparView)
        textFieldsStackView.addArrangedSubview(mnWparView)
        textFieldsStackView.addArrangedSubview(aWparView)
        textFieldsStackView.addArrangedSubview(eWrapView)
        textFieldsStackView.addArrangedSubview(pWrapView)
    }
    
    private func setupRegistrationButton() {
        contentView.addSubview(registrationButton)
        registrationButton.snp.makeConstraints { make in
            make.top.equalTo(textFieldsStackView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
        registrationButton.setTitle("Регистрация", for: .normal)
        registrationButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        registrationButton.backgroundColor = .systemGray2
        registrationButton.layer.cornerRadius = 10
        registrationButton.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        registrationButton.addTarget(self, action: #selector(didTapRegistrationButton), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func didTapCloseButton() {
        presenter?.onTapClose()
    }
    
    @objc
    private func didTapRegistrationButton() {
        presenter?.register(surname: surnameTextField.text ?? "",
                            firstName: firstNameTextField.text ?? "",
                            middleName: middleNameTextFiled.text ?? "",
                            address: addressTextField.text ?? "",
                            email: emailTextField.text ?? "",
                            password: passwordTextFiled.text ?? "")
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

extension RegistrationViewController: RegistrationViewControllerProtocol {
    
}
