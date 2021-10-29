//
//  UpdatePFControlerVC.swift
//  coffeeHub
//
//  Created by ZED on 28/10/21.
//

import UIKit

class UpdatePFControlerVC: UIViewController {

   
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var imagePF: UIImageView!
    @IBOutlet weak var btnUpdatePF: UIButton!
    
    @IBOutlet weak var textNamePF: UITextField!
    
    @IBOutlet weak var textPhonePF: UITextField!
    
    @IBOutlet weak var whiteView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "Profile"

        self.navigationItem.backBarButtonItem?.tintColor = .black
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ")
      
        
        imagePF.layer.cornerRadius = imagePF.frame.width / 2
        imagePF.layer.borderColor = UIColor.black.cgColor
        imagePF.layer.borderWidth = 1
        btnUpdatePF.layer.cornerRadius = 60
        btnUpdatePF.layer.borderColor = UIColor.black.cgColor
        btnUpdatePF.layer.borderWidth = 1
        
        bgView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        bgView.layer.cornerRadius = 25
        whiteView.layer.cornerRadius = 30
        whiteView.layer.shadowOffset = CGSize(width: 10,
                                                height: 10)
        whiteView.layer.shadowRadius = 3
        whiteView.layer.shadowOpacity = 0.1
        
        
        
        
        
        
    }
    
    @IBAction func updatePFimage(_ sender: Any){
        
        let vc = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateViewController(withIdentifier: "changePF") as? ChangePFControllerVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func update(_ sender: Any) {
    }
    

}
