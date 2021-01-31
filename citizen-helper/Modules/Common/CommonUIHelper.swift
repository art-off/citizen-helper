//
//  CommonUIHelper.swift
//  citizen-helper
//
//  Created by art-off on 31.01.2021.
//

import UIKit

enum CommonUIHelper {
    
    static func button(with title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .systemGray2
        button.layer.cornerRadius = 10
        
        return button
    }
    
    static func textFieldsStackView() -> UIStackView  {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }
    
    static func roundedTextFiled() -> (wrapView: UIView, textField: UITextField) {
        let textField = UITextField()
        let view = CustomTextField(textField: textField)
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        
        return (view, textField)
    }
    
}

// Вью, тап по которой начинает редактирование в textField
class CustomTextField: UIView {
    
    let textField: UITextField
    
    init(frame: CGRect, textField: UITextField) {
        self.textField = textField
        super.init(frame: frame)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.addGestureRecognizer(tap)
    }
    
    convenience init(textField: UITextField) {
        self.init(frame: .zero, textField: textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didTap() {
        textField.becomeFirstResponder()
    }
    
}
