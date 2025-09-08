//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Bora Aksoy on 11.01.2025.
//

import UIKit
import FirebaseFirestore

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentIDLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    // Like butonuna tıklanınca DocumentID'sine göre like sayısına erişip 1 tane arttıran fonksiyon
    @IBAction func likeButtonClicked(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            
            firestoreDatabase.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true)
        }
        
    }
    
}
