//
//  BlogPVC.swift
//  SAT Math
//
//  Created by Adam Buys on 7/9/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit

class BlogPVC: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    
    var pages = [UIViewController]()
    var pageViewController : UIPageViewController?
    var currentIndex = 0
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPages()
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        pageViewController!.setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height);
        
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
        
        self.pageViewController?.delegate = self
        
        configurePageControl()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configurePageControl() // adjusts to container size where as viewdidload doesnt have container set up yet 
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! BlogContentVC).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! BlogContentVC).pageIndex
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if (index == self.pages.count) {
            return nil
        }
        
        return viewControllerAtIndex(index: index)
    }

    
    func viewControllerAtIndex(index: Int) -> UIViewController?
    {
        if self.pages.count == 0 || index >= self.pages.count
        {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let pageContentViewController = pages[index]
        currentIndex = index
        
        return pageContentViewController
    }
    
    

  
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        
        let xPos = 0.00 //0.25*self.view.bounds.width
        let yPos = self.view.bounds.height-20
        let width = self.view.bounds.width //150 as CGFloat
        let height = 20 as CGFloat
        
        print(self.view.bounds.height)
        
       
        
        let ap = UIPageControl.appearance()
        ap.currentPage = 0
        ap.numberOfPages = pages.count
        ap.backgroundColor = UIColor.clear
        ap.tintColor = UIColor.black
        ap.pageIndicatorTintColor = UIColor.white
        ap.currentPageIndicatorTintColor =  UIColor.black
    
        pageControl = UIPageControl(frame: CGRect(x: CGFloat(xPos), y: CGFloat(yPos),width: width,height: height))
       
        
        self.view.addSubview(pageControl)
        
        self.view.bringSubview(toFront: pageControl)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = pages.index(of: pageContentViewController)!
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setUpPages() {
        
        let storyboard = UIStoryboard(name: "QuestionTable", bundle: Bundle.main)
        
        
        
        let page1: BlogContentVC! = storyboard.instantiateViewController(withIdentifier: "blogcontentvc") as! BlogContentVC
        page1.pageIndex = 0
        page1.image = UIImage(named: "blog1")
        //page1.view.backgroundColor = UIColor.blue
        let page2: BlogContentVC! = storyboard.instantiateViewController(withIdentifier: "blogcontentvc") as! BlogContentVC
        page2.pageIndex = 1
        page2.image = UIImage(named: "blog2")
        let page3: BlogContentVC! = storyboard.instantiateViewController(withIdentifier: "blogcontentvc") as! BlogContentVC
        page3.pageIndex = 2
        page3.image = UIImage(named: "blog3")
     
        
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
    }

}
