//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Bora Aksoy on 19.12.2024.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var choosenPainting = ""
    var choosenPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mevcut bir resim seçilmişse, ilgili verileri Core Data'dan çekip görüntüler.
        if choosenPainting != "" {
            saveButton.isHidden = true
            
            //Core Data işlemleri için gerekli nesneleri oluşturur.
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let context = appDelegate?.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            //Seçilen resmin id'sine göre veri çekmek için filtre uygulanır.
            let idString = choosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context!.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
            } catch {
                print("Error! : Data extraction from core data failed according to the name of the selected image.")
            }
        } else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
            
            nameText.text = ""
            artistText.text = ""
            yearText.text = ""
        }
        
        
        
        
        //Recognizers
        //Boşluğa dokununca klavyenin kapatılması için:
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        //Resim eklemek için imageView'a dokunma özelliği ekleme
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
    }

    
    
    
    //Yeni resim ve bilgilerini kaydetmek için ve önceki ekrana geri döner.
    @IBAction func saveButtonClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //NSEntityDescription.insertNewObject: Paintings varlığına (entity) yeni bir nesne ekler. Bu nesneye daha sonra veri atanacaktır.
        //Core Data'da yeni bir "Paintings varlığı oluşturur."
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        //Atributes
        //Kullanıcıdan alınan bilgileri ilgili alanlara ata.
        //nameText.text!: nameText adındaki bir UITextField'den alınan metni "name" alanına kaydeder.
        newPainting.setValue(nameText.text!, forKey: "name")
        
        newPainting.setValue(artistText.text!, forKey: "artist")
        
        newPainting.setValue(UUID(), forKey: "id")
        
        if let year = Int(yearText.text!) {
            newPainting.setValue(year, forKey: "year")
        }
        
        //Sıkıştırma kalitesi 0.5 olarak ayarlanmıştır (orta seviyede sıkıştırma).
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newPainting.setValue(data, forKey: "image")
        
        //Core Data'ya kaydet ve başarı durumunu kontrol et.
        do {
            try context.save()
            print("Success : The selected image and its information were successfully saved to Core Data.")
        } catch {
            print("Error! : There was an error when saving the selected image and its information to Core Data.")
        }
        
        //Ana ekrana geri dönerken yeni veriyi günceller.
        //NotificationCenter sınıfı ile VC'ler arası mesaj gönderilebiliyor.
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
        //Bir önceki view controller'a geçmesini sağlar.
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    //Klavyeyi gizler.
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    
    
    //Foto seçmek için resmin üstüne tıklayınca çağırılır;
    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary //Kitaplıktaki albümden foto seçilecek
        picker.allowsEditing = true //Seçtikten sonra düzenleme yapılabilecek
        present(picker, animated: true, completion: nil)
    }
    
    
    
    
    //Kullanıcı bir resim seçip işlemi tamamladığında çağırılır.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
}
