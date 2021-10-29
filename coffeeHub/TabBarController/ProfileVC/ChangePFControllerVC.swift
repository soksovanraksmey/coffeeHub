//
//  ChangePFControllerVC.swift
//  coffeeHub
//
//  Created by ZED on 28/10/21.
//

import UIKit

class ChangePFControllerVC: UIViewController {

    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Change Avatar"
        
        
        
        bgView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        bgView.layer.cornerRadius = 25
        whiteView.layer.cornerRadius = 30
        whiteView.layer.shadowOffset = CGSize(width: 10,
                                                height: 10)
        whiteView.layer.shadowRadius = 3
        whiteView.layer.shadowOpacity = 0.1
        
       
        
        
        
    }
    
    @IBAction func save(_ sender: Any) {
        
        
    }
    

}
