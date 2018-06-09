
//
//  Categories.Swift
//  RestaurantMenu
//
//  Created by Fatma Mohamed on 6/7/18.
//  Copyright © 2018 Fatma Mohamed. All rights reserved.
//


import Foundation
struct Categories : Decodable {
	let id : Int?
	let name : String?
	var items : [Items]?
    var isExpanded: Bool?


}
