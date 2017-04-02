
//
//  LoginCoordinator.swft.swift
//  PoFo
//
//  Created by Belal El-Monajjed on 2017-04-02.
//  Copyright © 2017 Belal El-Monajjed. All rights reserved.
//

import Foundation
import ILLoginKit

class LoginCoordinator: ILLoginKit.LoginCoordinator {
    
    override func start() {
        super.start()
        configureAppearance()
    }
    
    func configureAppearance() {
        // Customize the look with background & logo images
//        backgroundImage =
//            mainLogoImage =
//            secondaryLogoImage =
//            
//            // Change colors
//            _introSort = UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 1)
//        errorTintColor = UIColor(red: 253.0/255.0, green: 227.0/255.0, blue: 167.0/255.0, alpha: 1)
//        
//        // Change placeholder & button texts, useful for different marketing style or language.
//        loginButtonText = "Sign In"
//        signupButtonText = "Create Account"
//        facebookButtonText = "Login with Facebook"
//        forgotPasswordButtonText = "Forgot password?"
//        recoverPasswordButtonText = "Recover"
//        namePlaceholder = "Name"
//        emailPlaceholder = "E-Mail"
//        passwordPlaceholder = "Password!"
//        repeatPasswordPlaceholder = "Confirm password!"
    }

    // Handle login via your API
    override func login(email: String, password: String) {
        print(email)
        print("Login with: email =\(email) password = \(password)")

//        self.rootViewController.performSegueWithIdentifier("gotoPicker", sender: send)
//
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as! UserPickerController
        super.goToController(controller: "gotoPicker")

//        self.rootViewController.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    // Handle signup via your API
    override func signup(name: String, email: String, password: String) {
        print("Signup with: name = \(name) email =\(email) password = \(password)")
    }
    
    // Handle Facebook login/signup via your API
    override func enterWithFacebook(profile: FacebookProfile) {
        print("Login/Signup via Facebook with: FB profile =\(profile)")
    }
    
    // Handle password recovery via your API
    override func recoverPassword(email: String) {
        print("Recover password with: email =\(email)")
    }
    
    override func finish() {
        super.finish()
    }
    
    
}
