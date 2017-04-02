//
//  ViewController.swift
//  PoFo
//
//  Created by Belal El-Monajjed on 2/6/17.
//  Copyright © 2017 Belal El-Monajjed. All rights reserved.
//

import ILLoginKit

class ViewController: UIViewController {
    
    lazy var loginCoordinator: LoginCoordinator = {
        return LoginCoordinator(rootViewController: self)
    }()
    
    func showLogin() {
        loginCoordinator.start()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loginCoordinator.start()
    }
    
    //MARK: - hide status bar in swift3
    
    override var prefersStatusBarHidden: Bool {
        return true
    }  
}
