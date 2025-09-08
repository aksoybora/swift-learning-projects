//
//  DetailsVC.swift
//  9_LandmarkBook
//
//  Created by Bora Aksoy on 14.12.2024.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkNameLabel: UILabel!
    @IBOutlet weak var landmarkImageView: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkNameLabel.text = selectedLandmarkName
        landmarkImageView.image = selectedLandMarkImage
    }
}
