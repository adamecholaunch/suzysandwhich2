//
//  PracticeVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/10/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import ASHorizontalScrollView

class PracticeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let kCellHeight:CGFloat = 150
    var sampleTableView:UITableView!
    
    let sections = ["Practice Sets", "Practice By Topics", "Helpful Publicly Available Study Videos"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sampleTableView = UITableView(frame:CGRect(x: 0,y: 0,width: self.view.frame.size.width, height: self.view.frame.size.height), style:.grouped)
        sampleTableView.dataSource = self
        sampleTableView.delegate = self
        sampleTableView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.view.addSubview(sampleTableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.sections.count
    }
    
    
   /* func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = UIColor.red
        
        return vw
    } */
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.sampleTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let CellIdentifierPortrait = "CellPortrait";
        let CellIdentifierLandscape = "CellLandscape";
        let indentifier = self.view.frame.width > self.view.frame.height ? CellIdentifierLandscape : CellIdentifierPortrait
        var cell = tableView.dequeueReusableCell(withIdentifier: indentifier)
      
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: indentifier)
            cell?.selectionStyle = .none
            let horizontalScrollView:ASHorizontalScrollView = ASHorizontalScrollView(frame:CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: kCellHeight))
            //for iPhone 5s and lower versions in portrait
            horizontalScrollView.marginSettings_320 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 5, miniAppearWidthOfLastItem: 20)
            //for iPhone 4s and lower versions in landscape
            horizontalScrollView.marginSettings_480 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 5, miniAppearWidthOfLastItem: 20)
            // for iPhone 6 plus and 6s plus in portrait
            horizontalScrollView.marginSettings_414 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 5, miniAppearWidthOfLastItem: 20)
            // for iPhone 6 plus and 6s plus in landscape
            horizontalScrollView.marginSettings_736 = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 10, miniAppearWidthOfLastItem: 30)
            //for all other screen sizes that doesn't set here, it would use defaultMarginSettings instead
            horizontalScrollView.defaultMarginSettings = MarginSettings(leftMargin: 10, miniMarginBetweenItems: 10, miniAppearWidthOfLastItem: 20)
            
            if indexPath.section == 0{
                //you can set margin for specific item size here
                horizontalScrollView.shouldCenterSubViews = true
                horizontalScrollView.marginSettings_414?.miniMarginBetweenItems = 20
                horizontalScrollView.uniformItemSize = CGSize(width: 50, height: 50)
                //this must be called after changing any size or margin property of this class to get acurrate margin
                horizontalScrollView.setItemsMarginOnce()
                for _ in 1...3{
                    let button = UIButton(frame: CGRect.zero)
                    button.backgroundColor = UIColor.blue
                    horizontalScrollView.addItem(button)
                }
                _ = horizontalScrollView.centerSubviews()
            }
            else if indexPath.section == 1 {
                horizontalScrollView.uniformItemSize = CGSize(width: 80, height: 50)
                //this must be called after changing any size or margin property of this class to get acurrate margin
                horizontalScrollView.setItemsMarginOnce()
                for _ in 1...20{
                    let button = UIButton(frame: CGRect.zero)
                    button.backgroundColor = UIColor.purple
                    horizontalScrollView.addItem(button)
                }
            }
            else if indexPath.section == 2 {
                //instead of using frame to determine margin, using number of items per screen to calculate margin maybe eaiser than setting mini margin for multiple screen size
                horizontalScrollView.arrangeType = .byNumber
                horizontalScrollView.marginSettings_320 = MarginSettings(leftMargin: 10, numberOfItemsPerScreen: 4.25)
                horizontalScrollView.marginSettings_480 = MarginSettings(leftMargin: 10, numberOfItemsPerScreen: 5.25)
                horizontalScrollView.marginSettings_414 = MarginSettings(leftMargin: 10, numberOfItemsPerScreen: 4.25)
                horizontalScrollView.marginSettings_736 = MarginSettings(leftMargin: 10, numberOfItemsPerScreen: 7.375)
                //for all the other screen sizes which are not set here, margin would be calculated by frame instead
                
                horizontalScrollView.uniformItemSize = CGSize(width: 150, height: 150)
                //this must be called after changing any size or margin property of this class to get acurrate margin
                horizontalScrollView.setItemsMarginOnce()
                
                for _ in 1...8{
                    let videoView = UIWebView(frame: CGRect.zero)
                    videoView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UgWxvqIZLU4\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
                    videoView.scrollView.isScrollEnabled = false
                    videoView.scrollView.bounces = false

                    
                    horizontalScrollView.addItem(videoView)
                }
            }
            cell?.contentView.addSubview(horizontalScrollView)
            horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
            cell?.contentView.addConstraint(NSLayoutConstraint(item: horizontalScrollView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: cell!.contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0))
            cell?.contentView.addConstraint(NSLayoutConstraint(item: horizontalScrollView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: cell!.contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0))
            cell?.contentView.addConstraint(NSLayoutConstraint(item: horizontalScrollView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: kCellHeight))
            cell?.contentView.addConstraint(NSLayoutConstraint(item: horizontalScrollView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: cell!.contentView, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0))
        }
        else if let horizontalScrollView = cell?.contentView.subviews.first(where: { (view) -> Bool in
            return view is ASHorizontalScrollView
        }) as? ASHorizontalScrollView {
            horizontalScrollView.refreshSubView() //refresh view incase orientation changes
        }
        return cell!
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return kCellHeight
    }


}
