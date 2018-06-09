//
//  HeaderSectionTableViewCell.swift
//  RestaurantMenu
//
//  Created by Fatma Mohamed on 6/8/18.
//  Copyright © 2018 Fatma Mohamed. All rights reserved.
//

import UIKit

class HeaderSectionTableViewCell: UITableViewCell {

    @IBOutlet var headerView: UIView!
    @IBOutlet var headerButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
