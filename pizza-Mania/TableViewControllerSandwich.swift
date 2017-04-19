//
//  TableViewControllerSandwich.swift
//  pizza-Mania
//
//  Created by Maxime Ravau on 18/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class TableViewControllerSandwich: UITableViewController {

    
    var listeSandwich = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        initUI()
    }
    
    func initUI(){
        
        getSandwich()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listeSandwich.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype3", for: indexPath) as! TableViewCellSandwich

        let categorieObject: PFObject = listeSandwich[indexPath.row]
        
        cell.imageCover.image = UIImage()
        
        if let userPicture = categorieObject["Image"] as? PFFile {
            print("get user picture")
            userPicture.getDataInBackground(block: { (imageData: Data?, error: Error?) -> Void in
                print("get user picture response")
                if (error == nil) {
                    print("get user picture no error")
                    cell.imageCover.image = UIImage(data: imageData!)
                }
            })
            
        }
        cell.imageCover.layer.cornerRadius = 15
        cell.imageCover.layer.masksToBounds = true
        
        cell.labelPrix.layer.cornerRadius = 15
        cell.labelPrix.layer.masksToBounds = true
        
        cell.labelTitre.layer.cornerRadius = 15
        cell.labelTitre.layer.masksToBounds = true
        
        cell.labelIngredient.layer.cornerRadius = 15
        cell.labelIngredient.layer.masksToBounds = true
        
        cell.labelViande.layer.cornerRadius = 15
        cell.labelViande.layer.masksToBounds = true
        
        cell.labelPain.layer.cornerRadius = 15
        cell.labelPain.layer.masksToBounds = true
        
        cell.labelStaticViande.layer.cornerRadius = 15
        cell.labelStaticViande.layer.masksToBounds = true
        cell.labelStaticIngredient.layer.cornerRadius = 15
        cell.labelStaticIngredient.layer.masksToBounds = true

        cell.labelTitre.text = categorieObject["Titre"] as? String
        cell.labelViande.text = categorieObject["Viande"] as? String
        cell.labelIngredient.text = categorieObject["Ingredients"] as? String
        cell.labelPain.text = categorieObject["Pain"] as? String
        cell.labelPrix.text = categorieObject["Prix"] as? String

        return cell
    }
    

    func getSandwich(){
        
        let query = PFQuery(className:"Sandwich")
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print("Successfully retrieved \(objects!.count) scores.")
                self.listeSandwich = objects!
                self.tableView.reloadData()
                if let listeSandwich = objects {
                    for sandwich in listeSandwich {
                        let titre = sandwich["Titre"]
                        let viande = sandwich["Viande"]
                        let ingredient = sandwich["Ingredients"]
                        let pain = sandwich["Pain"]
                        let prix = sandwich["Prix"]
                        
                        print("\(String(describing: titre)), \(String(describing: viande)), \(String(describing: ingredient)), \(String(describing: pain)), \(String(describing: prix))")
                    }
                }
            }
            
        }
    }

   
}
