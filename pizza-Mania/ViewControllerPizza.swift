//
//  ViewControllerPizza.swift
//  pizza-Mania
//
//  Created by Maxime Ravau on 18/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class ViewControllerPizza: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var myCollectionView: UICollectionView!
    
    
    var categoriePizza = [PFObject]()
    
    var selectedCategorie: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        initUI()
        
    }
    
    
    func initUI(){
        
        
        getCategoriePizza()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        // On met une affiche de chaque film
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        //On return la liste de film entiere
        return categoriePizza.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Prototype1", for: indexPath) as! CollectionViewCellPizza
        
        let categorieObject: PFObject = categoriePizza[indexPath.row]
        
        cell.imagePizza.image = UIImage()
        
        cell.imagePizza.layer.cornerRadius = 15
        cell.imagePizza.layer.masksToBounds = true
        
        cell.labelCategorie.text = categorieObject["titre"] as? String
        
        if let userPicture = categorieObject["image"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                if (error == nil) {
                    print("get user picture no error")
                    cell.imagePizza.image = UIImage(data: imageData!)
                }
            })
            
        }

        
        return cell
    }
    
    
    func getCategoriePizza(){
        
        let query = PFQuery(className:"CategoriePizza")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print("Successfully retrieved \(objects!.count) scores.")
                self.categoriePizza = objects!
                self.myCollectionView.reloadData()
                if let categoriePizza = objects {
                    for categorie in categoriePizza {
                        let titre = categorie["titre"]
                        
                        print("\(String(describing: titre))")
                        
                    }
                }
            }
            
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.selectedCategorie = categoriePizza[indexPath.row]
        
        self.performSegue(withIdentifier: "segue.pizza", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue?, sender: Any?) {
        
        let nextScene = segue?.destination as! TableViewControllerPizzaDescription
        
        // je récupère l’index de la cellule sélectionné
        if (segue?.identifier == "segue.pizza"){
            //je récupère la catégorie a partir de cette index
            
                        nextScene.currentCategorie = self.selectedCategorie!
            
            // on récupère la segue pour pouvoir ensuite envoyer une nouvelle catégorie sur le button Coming Soon
        }

        
}

}
