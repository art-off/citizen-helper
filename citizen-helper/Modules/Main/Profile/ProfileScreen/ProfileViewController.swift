//
//  ProfileViewController.swift
//  citizen-helper
//
//  Created by art-off on 30.01.2021.
//

import UIKit


protocol ProfileViewControllerProtocol: BaseViewControllerProtocol {
    var presenter: ProfilePresenterProtocol? { get set }
}


class ProfileViewController: BaseViewController {
    
    var presenter: ProfilePresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

extension ProfileViewController: ProfileViewControllerProtocol { }
