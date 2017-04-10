//
//  SigninController.swift
//  PoFo
//
//  Created by Belal El-Monajjed on 2017-04-09.
//  Copyright © 2017 Belal El-Monajjed. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SkyFloatingLabelTextField
import SwiftyJSON
import SwiftSpinner
import ZAlertView

class SigninController: UIViewController {
    
    @IBOutlet var EmailTextField: SkyFloatingLabelTextField!
    @IBOutlet var PasswordTextFeild: SkyFloatingLabelTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        ZAlertView.positiveColor            = UIColor.color("#669999")
        ZAlertView.negativeColor            = UIColor.color("#CC3333")
        ZAlertView.blurredBackground        = true
        ZAlertView.showAnimation            = .bounceBottom
        ZAlertView.hideAnimation            = .bounceRight
        ZAlertView.initialSpringVelocity    = 0.9
        ZAlertView.duration                 = 2
        ZAlertView.textFieldTextColor       = UIColor.brown
        ZAlertView.textFieldBackgroundColor = UIColor.color("#EFEFEF")
        ZAlertView.textFieldBorderColor     = UIColor.color("#669999")
    }
    
    @IBAction func Signin(_ sender: Any) {
        SwiftSpinner.show("Logging in...")
        let parameters: Parameters = ["email": EmailTextField.text!, "password" : PasswordTextFeild.text!]
        Alamofire.request("http://13.84.217.62:3000/login", method: .post, parameters: parameters).responseJSON { response in
            debugPrint(response)
            
            let json = JSON(response.result.value!)
            

            if(json["status_code"].int == 200) {
                email = json["email"].stringValue
                name = json["name"].stringValue
                user_id = json["user_id"].stringValue
                user_type = json["user_type"].stringValue
                print("name: \(name)")
            }
            else if (json["status_code"].int == 401){
                print(": \(json["message"].stringValue)")
                let dialog = ZAlertView(title: "ERROR",
                                        message: json["message"].stringValue,
                                        closeButtonText: "Okay",
                                        closeButtonHandler: { alertView in
                                        alertView.dismissAlertView()
                }
                )
                
                dialog.show()

            }
            SwiftSpinner.hide()

        }
    }
}
