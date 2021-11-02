//
//  ProfileViewController.swift
//  coffeeHub
//
//  Created by zed on 10/22/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imagePf: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var whiteColorView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        imagePf.layer.cornerRadius = imagePf.frame.width / 2
        imagePf.layer.borderColor = UIColor.black.cgColor
        imagePf.layer.borderWidth = 1
        
        bgView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        bgView.layer.cornerRadius = 25
        whiteColorView.layer.cornerRadius = 30
        whiteColorView.layer.shadowOffset = CGSize(width: 10,
                                                height: 10)
        whiteColorView.layer.shadowRadius = 3
        whiteColorView.layer.shadowOpacity = 0.1
        
        
        

    }
    
    @IBAction func profileBtn(_ sender: Any) {
        
        let vc = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateViewController(withIdentifier: "updatePF") as? UpdatePFControlerVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func changePassBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateViewController(withIdentifier: "changePass") as? ChangePassControllerVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
    }
    
    
    
    
}
