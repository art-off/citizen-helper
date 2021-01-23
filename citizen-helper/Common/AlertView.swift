//
//  AlertView.swift
//  citizen-helper
//
//  Created by art-off on 23.01.2021.
//

import UIKit
import SnapKit

class AlertView: UIView {
    
    let alertLabel = UILabel()
    
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    convenience init(alertText: String) {
        self.init()
        alertLabel.text = alertText
    }
    
    // MARK: - Setup Views
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        layer.cornerRadius = 15
        backgroundColor = .gray
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
        setupLabels()
    }
    
    private func setupLabels() {
        alertLabel.textColor = .white
        alertLabel.textAlignment = .center
        alertLabel.numberOfLines = 0
        alertLabel.lineBreakMode = .byWordWrapping
        
        addSubview(alertLabel)
        alertLabel.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
    }
    
    // MARK: - Скрытие view с анимацией
    func hideWithAnimation() {
        alpha = 1.0
        isHidden = false
        
        UIView.animate(
            withDuration: 3.0,
            animations: {
                self.alpha = 0.0
            },
            completion: { finished in
                if finished { self.isHidden = true }
            }
        )
    }

}
