//
//  ChangePassControllerVC.swift
//  coffeeHub
//
//  Created by ZED on 30/10/21.
//

import UIKit

class ChangePassControllerVC: UIViewController {

    
    
    @IBOutlet weak var whiteColorView: UIView!
    @IBOutlet weak var bgView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        navigationItem.title = "Change PassWord"
        
        bgView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        bgView.layer.cornerRadius = 25
        whiteColorView.layer.cornerRadius = 30
        whiteColorView.layer.shadowOffset = CGSize(width: 10,
                                                height: 10)
        whiteColorView.layer.shadowRadius = 3
        whiteColorView.layer.shadowOpacity = 0.1
        
        
        
    }
    
    @IBAction func btnSave(_ sender: Any) {
    }
    
   
}
