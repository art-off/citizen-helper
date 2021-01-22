//
//  AuthUIHelper.swift
//  citizen-helper
//
//  Created by art-off on 22.01.2021.
//

import UIKit

enum AuthUIHelper {
    
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
