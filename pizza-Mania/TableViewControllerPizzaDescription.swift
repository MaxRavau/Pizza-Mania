//
//  TableViewControllerPizzaDescription.swift
//  pizza-Mania
//
//  Created by Maxime Ravau on 18/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit
import Parse

class TableViewControllerPizzaDescription: UITableViewController {

    var currentCategorie: PFObject?
    
    var listePizza = [PFObject]()
    
    @IBOutlet var labelCategorie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    func initUI(){
        
        
        getPizza()
        getTitle()
        
    }
    
    func getTitle(){
        
        let categorieTitle = currentCategorie?["titre"]
        
        labelCategorie.text = categorieTitle as! String?
        
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
        return listePizza.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype2", for: indexPath) as! TableViewCellPizzaDescription

        let pizzaObject: PFObject = listePizza[indexPath.row]
        
        cell.labelPizza.text = pizzaObject["Titre"] as? String
        cell.labelSousPizza.text = pizzaObject["SousTitre"] as? String
        cell.labelPrix.text = pizzaObject["Prix"] as? String
        
        cell.viewCustom.layer.cornerRadius = 15
        cell.viewCustom.layer.borderColor = UIColor.white.cgColor
        cell.viewCustom.layer.borderWidth = 1

        return cell
    }
    
    func getPizza(){
        
        let query = PFQuery(className:"Pizza")
        query.whereKey("CategorieObjectPizza", equalTo: currentCategorie)
        query.cachePolicy = PFCachePolicy.cacheThenNetwork
        query.findObjectsInBackground { (objects, error) in
            if error == nil {
                print("Successfully retrieved \(objects!.count) scores.")
                self.listePizza = objects!
                self.tableView.reloadData()
                if let listePizza = objects {
                    for pizza in listePizza {
                        let titre = pizza["Titre"]
                        let sousTitre = pizza["SousTitre"]
                        let prix = pizza["Prix"]
                        
                        
                        print("\(String(describing: titre)) \(String(describing: sousTitre))")
                        print("\(String(describing: prix))")
                        
                    }
                }
            }
            
        }
    }


    
}
