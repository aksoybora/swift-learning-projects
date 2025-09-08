//
//  FeedViewController.swift
//  InstaCloneFirebase
//
//  Created by Bora Aksoy on 10.01.2025.
//

import UIKit
import FirebaseFirestore
import SDWebImage //Url olan resmi göstermek için kullanılan kütüphane. Daha sonradan manuel olarak eklendi.

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var userEmailArray = [String]()
    var userDescriptionArray = [String]()
    var userImageArray = [String]()
    var userLikeArray = [Int]()
    var documentIDArray = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        getDataFromFirestore()
    }
    
    
    // Firestore'dan verileri çekmeyi sağlayan func
    func getDataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    // Dizideki varsayılan elemanların üstüne aynı elemanlar eklenmesin diye diziler temizleniyor.
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userDescriptionArray.removeAll(keepingCapacity: false)
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userLikeArray.removeAll(keepingCapacity: false)
                    self.documentIDArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documentIDArray.append(documentID)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        
                        if let postDescription = document.get("postDescription") as? String {
                            self.userDescriptionArray.append(postDescription)
                        }
                        
                        if let likes = document.get("likes") as? Int{
                            self.userLikeArray.append(likes)
                        }
                        
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    // Cell sayısını belirleyen func:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    
    // Cell'lerde neler gösterileceğini belirleyen func:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell //FeedCell'e erişme
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        cell.descriptionLabel.text = userDescriptionArray[indexPath.row]
        cell.likeLabel.text = String(userLikeArray[indexPath.row])
        cell.documentIDLabel.text = documentIDArray[indexPath.row]
        return cell
    }

}
