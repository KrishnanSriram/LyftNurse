//
//  ServiceCostCellTableViewCell.swift
//  LyftNurse
//
//  Created by Krishnan Sriram Rama on 3/23/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class ServiceCostCellTableViewCell: UITableViewCell {

    @IBOutlet weak var serviceCostLabel: UILabel!
    @IBOutlet weak var dollarLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
