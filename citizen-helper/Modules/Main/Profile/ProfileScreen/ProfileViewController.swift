//
//  ProfileViewController.swift
//  citizen-helper
//
//  Created by art-off on 30.01.2021.
//

import UIKit
import SnapKit


protocol ProfileViewControllerProtocol: BaseViewControllerProtocol {
    var presenter: ProfilePresenterProtocol? { get set }
}


class ProfileViewController: BaseViewController {
    
    var presenter: ProfilePresenterProtocol?
    
    
    // MARK: - UI
    private var nameView: UIView!
    private var nameLabel: UILabel!
    
    private var emailView: UIView!
    private var emailLabel: UILabel!
    
    private var addressView: UIView!
    private var addressLabel: UILabel!
    
    private var changePasswordButton: UIButton!
    
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Профиль"
        
        setupExitButton()
        
        setupNameView()
        setupEmailView()
        setupAddressView()
        setupChangePasswordButton()
    }
    
    // MARK: - Setup Views
    private func setupExitButton() {
        let button = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(didTapExitButton))
        navigationItem.rightBarButtonItem = button
    }
    
    private func setupNameView() {
        (nameView, nameLabel) = viewWithLabel()
        
        view.addSubview(nameView)
        nameView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nameLabel.text = "Рылов Артем Евгеньевич"
    }
    
    private func setupEmailView() {
        (emailView, emailLabel) = viewWithLabel()
        
        view.addSubview(emailView)
        emailView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        emailLabel.text = "tema2707@icloud.com"
    }
    
    private func setupAddressView() {
        (addressView, addressLabel) = viewWithLabel()
        
        view.addSubview(addressView)
        addressView.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        addressLabel.text = "ул. Молокова 14, кв. 332"
    }
    
    private func setupChangePasswordButton() {
        changePasswordButton = CommonUIHelper.button(with: "Изменить пароль")
        
        view.addSubview(changePasswordButton)
        changePasswordButton.snp.makeConstraints { make in
            make.top.equalTo(addressView.snp.bottom).offset(30)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        
        changePasswordButton.addTarget(self, action: #selector(didTapChangePasswordButton), for: .touchUpInside)
    }
    
    // MARK: - Helper UI
    private func viewWithLabel() -> (view: UIView, label: UILabel) {
        let view = UIView()
        view.backgroundColor = .systemGray2
        view.layer.cornerRadius = 10
        
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        return (view, label)
    }
    
    // MARK: - Actions
    @objc
    private func didTapExitButton() {
        presenter?.logOutCurrUser()
    }
    
    @objc
    private func didTapChangePasswordButton() {
        
    }
    
}

extension ProfileViewController: ProfileViewControllerProtocol { }
