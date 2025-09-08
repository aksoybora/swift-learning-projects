//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by Bora Aksoy on 10.01.2025.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseAuth

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionView: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Görselin üstüne basılması için;
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    
    // Görsel seçince kütüphaneden foto alabilmek için;
    @objc func chooseImage() {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    
    // Alınan fotonun VC üzerinde gösterilmesi için;
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // Mesaj oluşturma fonksiyonu
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // Resmin server'a yüklenmesi
    @IBAction func uploadClicked(_ sender: Any) {
        
        // Storage oluşturma
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        
        // Resmi dataya çevirip sıkıştırma
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            //mediaFolder'ın altına.jpg olarak kaydedilmesi
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { metadata, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Unknown Error")
                } else {
                    imageReference.downloadURL { (url, error) in
                        
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            // Database - Firebase'e kaydetme
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReference : DocumentReference? = nil
                            let firestorePost = ["imageUrl" : imageUrl!, "postedBy" : Auth.auth().currentUser!.email!, "postDescription": self.descriptionView.text!, "date" : FieldValue.serverTimestamp(), "likes" : 0] as [String : Any]
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                
                                if error != nil {
                                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error was accured during the upload.")
                                } else {
                                    self.imageView.image = UIImage(named: "selectImage.png")
                                    self.descriptionView.text = ""
                                    self.tabBarController?.selectedIndex = 0 // Feed sayfasına götürmesi için
                                }
                            })
                        }
                    }
                }
            }
        }
    }
    
    
    
}
