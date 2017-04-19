//
//  TableViewCellSandwich.swift
//  pizza-Mania
//
//  Created by Maxime Ravau on 18/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class TableViewCellSandwich: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet var labelStaticIngredient: UILabel!
    @IBOutlet var labelStaticViande: UILabel!
    @IBOutlet var labelTitre: UILabel!
    @IBOutlet var labelViande: UILabel!
    @IBOutlet var labelPrix: UILabel!
    @IBOutlet var labelIngredient: UILabel!
    @IBOutlet var labelPain: UILabel!
    @IBOutlet var imageCover: UIImageView!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
