//
//  ViewControllerPFaim.swift
//  pizza-Mania
//
//  Created by Maxime Ravau on 18/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class ViewControllerPFaim: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    var listePFaim = [NSObject]()
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCollectionView.delegate = self
        myCollectionView.dataSource = self
       
        getCategoriePFaim()
        
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
        return listePFaim.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Prototype5", for: indexPath) as! CollectionViewCellPFaim
        
        let categorieObject: PFObject = listePFaim[indexPath.row] as! PFObject
        
        cell.ImageCover.image = UIImage()
        
        if let userPicture = categorieObject["Image"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                if (error == nil) {
                    print("get user picture no error")
                    cell.ImageCover.image = UIImage(data: imageData!)
                }
            })
            
        }
        
        cell.ImageCover.layer.cornerRadius = 15
        cell.ImageCover.layer.masksToBounds = true
        
        cell.labelTitre.text = categorieObject["Titre"] as? String
        cell.labelPrix.text = categorieObject["Prix"] as? String
        
        return cell
    }
    
    
    func getCategoriePFaim(){
        
        let query = PFQuery(className:"PetiteFaim")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print("Successfully retrieved \(objects!.count) scores.")
                self.listePFaim = objects!
                self.myCollectionView.reloadData()
                if let listePFaim = objects {
                    for PFaim in listePFaim {
                        let titre = PFaim["Titre"]
                        let prix = PFaim["Prix"]
                        
                        print("\(String(describing: titre)), \(String(describing: prix))")
                        
                    }
                }
            }
            
        }
    }


   
}
