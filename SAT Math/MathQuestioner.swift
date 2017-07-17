//
//  MathQuestioner.swift
//  SAT Math
//
//  Created by Adam Buys on 6/17/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import Pageboy


let nc = NotificationCenter.default

class MathQuestioner: PageboyViewController, PageboyViewControllerDataSource, PageboyViewControllerDelegate {
    
    // MARK: Properties
    
    let testProblemSet : [Problem] = [ExampleProblems().problem1, ExampleProblems().problem2]
    let numberOfpages = 2
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.dataSource = self
        self.delegate = self
        

        nc.addObserver(self, selector: #selector(turnOffScroll), name: Notification.Name("disableScroll"), object: nil)
        nc.addObserver(self, selector: #selector(turnOnScroll), name: Notification.Name("enableScroll"), object: nil)
       
    }
    
    
    
    func turnOffScroll() {
        self.isScrollEnabled = false
    }
    
    
    
    func turnOnScroll() {
        print("back on")
        self.isScrollEnabled = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //
    // MARK: PageboyViewControllerDataSource
    //
    
    func viewControllers(forPageboyViewController pageboyViewController: PageboyViewController) -> [UIViewController]? {
         let storyboard = UIStoryboard(name: "QuestionTable", bundle: Bundle.main)
        
        var viewControllers = [UIViewController]()
       
        for i in 0..<numberOfpages {
            
            
            let viewController = storyboard.instantiateViewController(withIdentifier: "questiontable") as! MCQuestionTable
      
            print("hereadfasdf")
            
            viewController.problem = testProblemSet[i]
            viewController.index = i + 1
            viewControllers.append(viewController)
        }
        return viewControllers
    }
    
    func defaultPageIndex(forPageboyViewController pageboyViewController: PageboyViewController) -> PageboyViewController.PageIndex? {
        return nil
    }

    
    // MARK: PageboyViewControllerDelegate
    //
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController,
                               willScrollToPageAtIndex index: Int,
                               direction: PageboyViewController.NavigationDirection,
                               animated: Bool) {
    
        
        
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController,
                               didScrollToPosition position: CGPoint,
                               direction: PageboyViewController.NavigationDirection,
                               animated: Bool) {
        
       // let isVertical = navigationOrientation == .vertical
       
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController,
                               didScrollToPageAtIndex index: Int,
                               direction: PageboyViewController.NavigationDirection,
                               animated: Bool) {
        
    }
    
    func pageboyViewController(_ pageboyViewController: PageboyViewController,
                               didReload viewControllers: [UIViewController],
                               currentIndex: PageboyViewController.PageIndex) {
        
    }
    
  
}



