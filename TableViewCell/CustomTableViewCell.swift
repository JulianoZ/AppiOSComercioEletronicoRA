//
//  CustomTableViewCell.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 28/06/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var precoLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
