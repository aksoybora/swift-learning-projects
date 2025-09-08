//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Bora Aksoy on 10.12.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var isMcqueen = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true //Resmin üstüne tıklanılabilsin.
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic)) //tıklanınca fonskiyonu çalıştırsın
        imageView.addGestureRecognizer(gestureRecognizer)
                                                
    }
    
    @objc func changePic() {
        if isMcqueen == true {
            imageView.image = UIImage(named: "sally")
            nameLabel.text = "Sally Carrera"
            isMcqueen = false
        }
        else {
            imageView.image = UIImage(named: "mcqueen")
            nameLabel.text = "Lightning Mcquenn"
            isMcqueen = true
        }
    }
}

