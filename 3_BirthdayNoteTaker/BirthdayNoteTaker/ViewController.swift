//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Bora Aksoy on 10.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting -> as? vs as! (Force casting)
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
        //Küçük verileri hafızaya kaydetmek için UserDefaults kullanıyoruz.
        UserDefaults.standard.setValue(nameTextField.text!, forKey: "name")
        UserDefaults.standard.setValue(birthdayTextField.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deleteClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //"" vs nil
        //UserDefaultdan silme işlemi
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        }
    }
}

