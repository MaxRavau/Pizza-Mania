//
//  ViewController.swift
//  pizza-Mania
//
//  Created by Maxime Ravau on 13/04/2017.
//  Copyright © 2017 Maxime Ravau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonCarteTap: UIButton!
    
    @IBOutlet var buttonCoordonneeTap: UIButton!
    
    @IBOutlet var viewCoordonnee: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customButton()
        effetVisual()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customButton(){
        
        buttonCarteTap.layer.cornerRadius = 10
        buttonCarteTap.layer.borderWidth = 2
        buttonCarteTap.layer.borderColor = UIColor.black.cgColor
        
        buttonCoordonneeTap.layer.cornerRadius = 10
        buttonCoordonneeTap.layer.borderWidth = 2
        buttonCoordonneeTap.layer.borderColor = UIColor.black.cgColor

        
        
    }
    
    func effetVisual(){
        
        viewCoordonnee.layer.cornerRadius = 10
        viewCoordonnee.layer.borderColor = UIColor.black.cgColor
        viewCoordonnee.layer.borderWidth = 1
    }
    
    func animateIn(){
        
        self.view.addSubview(viewCoordonnee)
        viewCoordonnee.center = self.view.center
        
        viewCoordonnee.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        viewCoordonnee.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            
            
            self.viewCoordonnee.alpha = 0.9
            self.viewCoordonnee.transform = CGAffineTransform.identity
            
            
            
        }
        
    }

    func animateOut(){
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.viewCoordonnee.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.viewCoordonnee.alpha = 0
            
            
            
        }) { (success: Bool) in
            self.viewCoordonnee.removeFromSuperview()
        }
    }
    
    @IBAction func dismissButtonView(_ sender: Any) {
    
        animateOut()
    }
    
    @IBAction func buttonCarteAction(_ sender: Any) {
    
    }
    
    @IBAction func buttonCoordonneeAction(_ sender: Any) {
    
        animateIn()
        
    }
    @IBAction func callPhoneButton(_ sender: Any) {
    
        
        var url: NSURL = NSURL(string: "tel://0490970825")!
        UIApplication.shared.openURL(url as URL)
    
    }

}

