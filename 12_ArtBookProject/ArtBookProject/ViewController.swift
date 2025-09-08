//
//  ViewController.swift
//  ArtBookProject
//
//  Created by Bora Aksoy on 19.12.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var nameArray = [String]()
    var idArray = [UUID]()
    var selectedPainting = ""
    var selectedPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Sağ üst navigasyon barına + ikonu ekleme:
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
        getData() //Uygulama açıldığında mevcut verileri yükler.
    }
    
    
    
    
    //getData mesajını gördüğünde (Yeni veri eklendiğinde) fonksiyonu çağıracak ve Tableview güncellenmiş olacak.
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newData"), object: nil)
    }
    
    
    
    
    //Core Data'dan Paintings entity'sini çeker ve çekilen resim adlarını ve kimliklerini ilgili dizilere ekler ve tabloyu yeniler.
    @objc func getData() {
        nameArray.removeAll(keepingCapacity: false)
        idArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate //Uygulamanın AppDelegate nesnesine erişim sağlar.
        let context = appDelegate.persistentContainer.viewContext //Core Data için gerekli olan veri saklama konteyneridir.
        
        //NSFetchRequest: Core Data'dan veri çekmek için bir istektir.
        //Core datadan "Paintings varlıklarını almak için bir fetch request oluşturur."
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
        //Bu seçenek, nesneleri hafızaya tam olarak yükler. Eğer true olarak ayarlanırsa, nesneler hafızaya kısmi olarak yüklenir ve erişim sağlanana kadar tam veriye erişilmez.
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest) //Fetch işlemini gerçekleştirir.
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    
                    if let name = result.value(forKey: "name") as? String {
                        self.nameArray.append(name)
                    }
                    
                    if let id = result.value(forKey: "id") as? UUID {
                        self.idArray.append(id)
                    }
                    
                    self.tableView.reloadData()
                }
            }
        } catch {
            print("Error! : Adding data to TableView!")
        }
    }
    
    
    

    // + butonuna tıklanınca yeni resim ekleme ekranında (DetailsVC) geçiş yapar.
    @objc func addButtonClicked() {
        selectedPainting = ""
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    

    //Tablo satır sayısını belirler.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    
    
    
    //Tablo hücresinin içeriğini belirler.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = nameArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    
    //Segue işlemi sırasında verileri diğer VC'ye gönderir.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as? DetailsVC
            destinationVC?.choosenPainting = selectedPainting
            destinationVC?.choosenPaintingId = selectedPaintingId
        }
    }
    
    
    
    
    //Tablo satırına tıklanınca ilgili resim seçilir ve detay ekranına geçiş yapılır.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPainting = nameArray[indexPath.row]
        selectedPaintingId = idArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    
    
    
    //Tablo satırını silme işlemi
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            //Fetch request oluşturup, ilgili veriyi çekicez ve daha sonra çektiğimiz veriyi sileceğiz.
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = idArray[indexPath.row].uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        if let id = result.value(forKey: "id") as? UUID {
                            
                            if id == idArray[indexPath.row] {
                                context.delete(result)
                                idArray.remove(at: indexPath.row)
                                nameArray.remove(at: indexPath.row)
                                self.tableView.reloadData()
                                
                                do {
                                    try context.save()
                                } catch {
                                    print("Error 2!")
                                }
                                
                                break
                            }
                        }
                    }
                }
            } catch {
                print("Error 1!")
            }
        }
    }
    
}

