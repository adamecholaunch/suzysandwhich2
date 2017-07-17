//
//  RateUsVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/12/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import StoreKit

class RateUsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let checkURL = NSURL(string: "https://geo.itunes.apple.com/us/app/airbnb/id401626263?mt=8") {
            
            if UIApplication.shared.openURL(checkURL as URL) {
                print("url sucefully opened")
            }
            
        } else {
            print("invalid url")
        }
    }

 

}
