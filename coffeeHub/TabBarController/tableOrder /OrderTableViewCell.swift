//
//  OrderTableViewCell.swift
//  coffeeHub
//
//  Created by zed on 10/22/21.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCofe: UIImageView!
    @IBOutlet weak var nameCofe: UILabel!
    
    @IBOutlet weak var viewBodey: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBodey?.layer.cornerRadius = 50
        viewBodey?.layer.shadowOffset = CGSize(width: 10,
                                                height: 10)
        viewBodey?.layer.shadowRadius = 3
        viewBodey?.layer.shadowOpacity = 0.1
        
    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


