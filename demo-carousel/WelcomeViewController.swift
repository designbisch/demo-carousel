//
//  WelcomeViewController.swift
//  demo-carousel
//
//  Created by Josh Bisch on 5/14/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupImage: UIImageView!
    @IBOutlet weak var backupView: UIView!
    
    var backupVisable: CGFloat!
    var backupHidden: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        
        self.backupView.alpha = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        // Set backupImage alpha to visable
        if pageControl.currentPage == 3 {
            //pageControl.hidden = true
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.backupView.alpha = 1
            })
            
            
        } else {
            pageControl.hidden = false
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.backupView.alpha = 0
            })
        }
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if pageControl.currentPage == 3 {
            //pageControl.hidden = true
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.backupView.alpha = 0
            })
            
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
