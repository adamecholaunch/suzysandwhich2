//
//  HomeVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/9/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import SWRevealViewController

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavBar()
    }

    func setUpNavBar() -> Void {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.plain
            , target: nil, action: nil)
        
        backButton.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!], for: UIControlState.normal)
        
        let backBTN = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = backBTN
        
        
        if self.revealViewController() != nil {
            backBTN.target = self.revealViewController()
            backBTN.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
    }
    
    
    
}

class ContainerView : UIViewController {
    @IBOutlet var myPageController: UIPageControl!
}




















