//
//  MenuModel.swift
//  RestaurantMenu
//
//  Created by Fatma Mohamed on 6/7/18.
//  Copyright © 2018 Fatma Mohamed. All rights reserved.
//

import Foundation
import Alamofire

class MenuModel {
    
    
    static func getData (ReturnBlock:@escaping ( _ data: Any? , _ error:NSError? ) -> Void){
        let mainURL = "https://elmenus.getsandbox.com/menu"
        let headers = ["Content-Type": "application/json"]
        Alamofire.request(mainURL , method: .get, parameters: nil , encoding: JSONEncoding.default, headers: headers).responseJSON{(response:DataResponse<Any>) in
           
            switch(response.result)
            {
                
            case .success(_):
                    
                    let jsonDecoder = JSONDecoder()
                do
                {
                    let menuModel = try jsonDecoder.decode(BaseObject.self, from: response.data!)
                    ReturnBlock(menuModel,nil)
                }
                    
                catch
                {
                    ReturnBlock(nil,error as NSError)
                }
                
                break
            case .failure(_):
                ReturnBlock(nil, response.result.error! as NSError)
                break
            }
            
            
            
        }
        
    }

}
