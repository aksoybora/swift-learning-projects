//
//  ViewController.swift
//  14_DarkModeProject
//
//  Created by Bora Aksoy on 3.01.2025.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Bu view controller sadece light mod olsun.
        //overrideUserInterfaceStyle = .light
    }
    
    // Görünüm temasına göre buton rengi değiştirme
    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            changeButton.tintColor = UIColor.systemPink
        } else {
            changeButton.tintColor = UIColor.black
        }
    }
    
    //Trait değişiklerini anında algılayan ve hemen buton rengi değiştiren fonksiyon
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            changeButton.tintColor = UIColor.systemPink
        } else {
            changeButton.tintColor = UIColor.black
        }
    }

}

