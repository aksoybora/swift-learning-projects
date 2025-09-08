//
//  ViewController.swift
//  AlertProject
//
//  Created by Bora Aksoy on 10.12.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var password2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signupClicked(_ sender: Any) {
        if usernameTextField.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Username not found!")
        }
        else if passwordTextField.text == "" {
            makeAlert(titleInput: "Error", messageInput: "Password not found!")
        }
        else if passwordTextField.text != password2TextField.text {
            makeAlert(titleInput: "Error", messageInput: "Passwords no match!")
        }
        else {
            makeAlert(titleInput: "Success", messageInput: "Sign up success!")
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

