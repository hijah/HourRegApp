//
//  LoginViewController.swift
//  PNRustfriApp
//
//  Created by Casper on 12/12/2018.
//  Copyright © 2018 Casper. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailtextfield: UITextField!
    
    @IBOutlet weak var passwordtextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logintabbed(_ sender: Any) {
        if let email = self.emailtextfield.text, let password = self.passwordtextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user , error) in
                if user != nil {
                    print ("Succes")
                    self.performSegue(withIdentifier: "nyarbejdsopgave", sender: self)
                }
                if error != nil {
                    print ("ups")
                }
            }
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
