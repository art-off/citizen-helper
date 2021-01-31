//
//  BaseViewController.swift
//  citizen-helper
//
//  Created by art-off on 23.01.2021.
//

import UIKit

protocol BaseViewControllerProtocol: AnyObject {
    func showAlert(with text: String)
    
    func startLoagingAnimation()
    func stopLoagingAnimation()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    
    private let alertView = AlertView()
    private let activityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    func showAlert(with text: String) {
        if !view.subviews.contains(alertView) {
            view.addSubview(alertView)

            alertView.translatesAutoresizingMaskIntoConstraints = false
            alertView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
            alertView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        }

        alertView.alertLabel.text = text
        alertView.hideWithAnimation()
    }
    
    func startLoagingAnimation() {
        if !view.subviews.contains(activityIndicatorView) {
            view.addSubview(activityIndicatorView)
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        }
        activityIndicatorView.startAnimating()
        
        view.isUserInteractionEnabled = false
    }
    
    func stopLoagingAnimation() {
        activityIndicatorView.stopAnimating()
        activityIndicatorView.removeFromSuperview()
        
        view.isUserInteractionEnabled = true
    }
    
}
