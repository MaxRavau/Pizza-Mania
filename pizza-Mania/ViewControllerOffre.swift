//
//  ViewControllerOffre.swift
//  pizza-Mania
//
//  Created by Maxime Ravau on 18/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewControllerOffre: UIViewController {

    @IBOutlet var offreView: UILabel!
    @IBOutlet var offreView1: UILabel!
    @IBOutlet var offreView2: UILabel!
    @IBOutlet var imageBoitePizza: UIImageView!
    @IBOutlet var viewBoitePiza: UIView!
        
    @IBOutlet var labelOffre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customView(){
    
        offreView.layer.cornerRadius = 15
        offreView.layer.masksToBounds = true
        offreView.layer.borderWidth = 1.5
        offreView.layer.borderColor = UIColor.white.cgColor
        
        offreView1.layer.cornerRadius = 15
        offreView1.layer.masksToBounds = true
        offreView1.layer.borderWidth = 1.5
        offreView1.layer.borderColor = UIColor.white.cgColor
        
        offreView2.layer.cornerRadius = 15
        offreView2.layer.masksToBounds = true
        offreView2.layer.borderWidth = 1.5
        offreView2.layer.borderColor = UIColor.white.cgColor
        
        imageBoitePizza.layer.cornerRadius = 15
        imageBoitePizza.layer.masksToBounds = true
        viewBoitePiza.layer.cornerRadius = 15
        viewBoitePiza.layer.masksToBounds = true
        
    }
    
}
