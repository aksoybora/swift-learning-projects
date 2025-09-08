//
//  ViewController.swift
//  9_LandmarkBook
//
//  Created by Bora Aksoy on 14.12.2024.
//

import UIKit

//TableView kullanmak için iki protokolü de eklememiz lazım.
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textLabel: UILabel!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var choosenLandMarkName = ""
    var choosenLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Her ne kadar ViewControllera protokol tanımlamaları yapsak da self tanımlamalarını yine de yapmak gerekiyor!
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Collosseum")
        landmarkNames.append("Eiffel Tower")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Statue of Liberty")
        landmarkNames.append("Tac Mahal")
        
        landmarkImages.append(UIImage(named: "collosseum.jpeg")!)
        landmarkImages.append(UIImage(named: "eiffelTower.jpeg")!)
        landmarkImages.append(UIImage(named: "greatWall.jpeg")!)
        landmarkImages.append(UIImage(named: "statueOfLiberty.jpeg")!)
        landmarkImages.append(UIImage(named: "tacMahal.jpeg")!)
    }

    //Yukarıdaki protokoller için aşağıdaki iki fonksiyonu da tanımlamak gerekiyor:
    
    //Kaç tane girdi olacak?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }

    //Hücrelerde (cell) ne gösterilecek?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        //( cell.textLabel?.text = "Text" ) de yapılabilir ama artık bu kullanım tedavülden kalkacak.
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row] //Direkt dizi içinde sırasıyla ne varsa onu alır.
        cell.contentConfiguration = content
        return cell
    }
    
    //Rowları seçince ne olacağını bu fonksiyona yazıyoruz:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLandMarkName = landmarkNames[indexPath.row]
        choosenLandMarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    //Seguenin ne yapacağını yazıyoruz:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = choosenLandMarkName
            destinationVC.selectedLandMarkImage = choosenLandMarkImage
        }
    }
    
    //Silme işlemi için:
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
}

