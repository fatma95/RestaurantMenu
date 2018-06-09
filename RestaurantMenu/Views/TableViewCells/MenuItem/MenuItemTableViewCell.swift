//
//  MenuItemTableViewCell.swift
//  RestaurantMenu
//
//  Created by Fatma Mohamed on 6/7/18.
//  Copyright © 2018 Fatma Mohamed. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
