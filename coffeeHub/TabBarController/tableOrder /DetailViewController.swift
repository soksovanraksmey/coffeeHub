//
//  DetailViewController.swift
//  coffeeHub
//
//  Created by zed on 10/26/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var imageBg: UIImageView!
    @IBOutlet weak var imageCupDetail: UIImageView!
    @IBOutlet weak var nameCofeLbl: UILabel!
    @IBOutlet weak var btnSum: UIButton!
    @IBOutlet weak var btnSubtract: UIButton!
    @IBOutlet weak var numOfCofe: UILabel!
  
    @IBOutlet weak var pricelbl: UILabel!
 
    @IBOutlet weak var mediumCup: UIButton!
    @IBOutlet weak var smallCup: UIButton!
    @IBOutlet weak var bigCup: UIButton!
    
    var navigationNameBar:String?
    var listData:Getmenu?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = navigationNameBar
        styleBtnleft(uiButton: btnSubtract)
        styleBtnRight(uiButton: btnSum)
        imageBg.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        imageBg.layer.cornerRadius = 25
        
        
    }
    
    @IBAction func btnSum(_ sender: Any) {
        guard let listData = listData else {
            return
        }
        let addCup = numOfCofe.text
        let numberOfCup = Int(addCup!)! + 1
        let total = Float(numberOfCup) * (Float(listData.price))
        
        numOfCofe.text = "\(numberOfCup)"
        pricelbl.text = "\(total)"
    }
    
    @IBAction func btnSubtract(_ sender: Any) {
        guard let listData = listData else {
            return
        }
        let subStractCup = numOfCofe.text
        let numberOfCup = Int(subStractCup!)! - 1
        let total = Float(numberOfCup) * (Float(listData.price))
 
        if numberOfCup <= 0 {
            btnSubtract.isEnabled = false
        }else{
            numOfCofe.text = "\(numberOfCup)"
            pricelbl.text = "\(total)"
        }
        
        btnSubtract.isEnabled = true
            
    }
    
    func styleBtnleft(uiButton:UIButton){
        uiButton.layer.cornerRadius = 10
        uiButton.layer.maskedCorners =  [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        uiButton.layer.borderColor = UIColor.black.cgColor
        uiButton.layer.borderWidth = 2
        
        
    }
    func styleBtnRight(uiButton:UIButton){

        uiButton.layer.cornerRadius = 10
        uiButton.layer.maskedCorners =  [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        uiButton.layer.borderColor = UIColor.black.cgColor
        uiButton.layer.borderWidth = 2
    }

    func getData(){
        
        if let data = listData{
        nameCofeLbl.text = listData?.name
            pricelbl.text = "\(data.price)"
            imageCupDetail.load(url: URL(string: data.image)!)
            
        }
        
    }
   
    @IBAction func smallcup(_ sender: Any) {
        let imageNofill = UIImage(systemName: "cupSize")

        let imageBg = UIImage(systemName: "cupSize1")
        smallCup.setBackgroundImage(imageBg, for: .normal)
        mediumCup.setBackgroundImage(imageNofill, for: .normal)
        bigCup.setBackgroundImage(imageNofill, for: .normal)
    }
    @IBAction func mediumCup(_ sender: Any) {
        let imageNofill = UIImage(systemName: "cupSize")

        let imageBg = UIImage(systemName: "cupSize1")
        mediumCup.setBackgroundImage(imageBg, for: .normal)
        bigCup.setBackgroundImage(imageNofill, for: .normal)
        smallCup.setBackgroundImage(imageNofill, for: .normal)
    }
    @IBAction func bigCup(_ sender: Any) {
        let imageNofill = UIImage(systemName: "cupSize")
        let imageBg = UIImage(named: "cupSize1")
        bigCup.setBackgroundImage(imageBg, for: UIControl.State.normal)
//        bigCup.setImage(imageBg, for: .normal)
//        mediumCup.setBackgroundImage(imageNofill, for: .normal)
//        smallCup.setBackgroundImage(imageNofill, for: .normal)
        
    }
    
    
}




