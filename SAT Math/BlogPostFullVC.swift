//
//  BlogPostFullVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/10/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit

class BlogPostFullVC: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    var requestToLoad : URLRequest?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if requestToLoad != nil {
           
            self.webview.loadRequest(requestToLoad!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
