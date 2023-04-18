//
//  FruitsTVC.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 16/04/2023.
//

import UIKit

class FruitsTVC: UITableViewCell {
    
    
    @IBOutlet weak var fruitsView: UIView!

    @IBOutlet weak var fruitsLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
