//
//  AuthUIHelper.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import UIKit

enum AuthUIHelper {
    
    static func titleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .medium)
        label.textAlignment = .center
        return label
    }
    
    static func emblemImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "krasnoyarsk.emblem")
        return imageView
    }
    
    static func textFieldsStackView() -> UIStackView  {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }
    
    static func roundedTextFiled() -> (wrapView: UIView, textField: UITextField) {
        let view = UIView()
        let textField = UITextField()
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        view.backgroundColor = .systemGray5
        
        view.layer.cornerRadius = 10
        
        return (view, textField)
    }
    
}
