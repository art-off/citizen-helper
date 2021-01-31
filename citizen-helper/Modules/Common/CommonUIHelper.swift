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
    
}
