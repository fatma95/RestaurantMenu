//
//  AlertMessages.swift
//  RestaurantMenu
//
//  Created by Fatma Mohamed on 6/8/18.
//  Copyright © 2018 Fatma Mohamed. All rights reserved.
//

import Foundation
import UIKit


class ShowAlert{
    
    static func showAlertInView(alertMessage:String , parent: UIViewController)
    {
        let alertController = UIAlertController(title: nil, message: alertMessage , preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        alertController.addAction(okAction)
        parent.present(alertController, animated: true, completion: nil)
    }
    
    static func showLoader(alertMessage:String , parent: UIViewController)
    {
        let alert = UIAlertController(title: nil, message: alertMessage, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        
        parent.present(alert, animated: true, completion: nil)
    }
}
