//
//  ProfilePresenter.swift
//  citizen-helper
//
//  Created by art-off on 30.01.2021.
//

import Foundation


protocol ProfilePresenterProtocol {
    
}


class ProfilePresenter {
    
    private weak var controller: ProfileViewControllerProtocol?
    
    
    init(controller: ProfileViewControllerProtocol) {
        self.controller = controller
    }
    
}

extension ProfilePresenter: ProfilePresenterProtocol {
    
}
