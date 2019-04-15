//
//  vegTableViewCell.swift
//  VegFood
//
//  Created by Kanchan chatrath on 4/15/19.
//  Copyright © 2019 Kanchan chatrath. All rights reserved.
//

import UIKit

class vegTableViewCell: UITableViewCell {

    
   
    @IBOutlet weak var dishimages: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
