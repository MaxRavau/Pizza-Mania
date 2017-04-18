//
//  TableViewCellPizzaDescription.swift
//  pizza-Mania
//
//  Created by Maxime Ravau on 18/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class TableViewCellPizzaDescription: UITableViewCell {

   
    @IBOutlet var labelPizza: UILabel!
    @IBOutlet var labelSousPizza: UILabel!
    @IBOutlet var labelPrix: UILabel!
    @IBOutlet var viewCustom: UIView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
