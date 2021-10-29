//
//  ViewController.swift
//  coffeeHub
//
//  Created by zed on 10/18/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getCofeBtn(_ sender: Any) {
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "login")
        vc!.modalPresentationStyle = .fullScreen;        navigationController?.pushViewController(vc!, animated: true)
    
    
    }
    
}

