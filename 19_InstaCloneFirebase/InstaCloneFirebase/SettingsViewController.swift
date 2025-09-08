//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by Bora Aksoy on 10.01.2025.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {

    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userEmailLabel.text = Auth.auth().currentUser?.email!
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("Logout Error!")
        }
    }
    
}
