//
//  CustomPedidosTableViewCell.swift
//  IFSPRAV4
//
//  Created by DC UFSCar on 03/10/19.
//  Copyright © 2019 DC UFSCar. All rights reserved.
//

import UIKit

class CustomPedidosTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var nomeLbl: UILabel!
    
    
    @IBOutlet weak var dataLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
