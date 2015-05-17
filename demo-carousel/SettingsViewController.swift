//
//  SettingsViewController.swift
//  demo-carousel
//
//  Created by Josh Bisch on 5/16/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCloseBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressSignOutBtn(sender: AnyObject) {
        var alertViewSignin = UIAlertController(title: "Signing out...", message: nil, preferredStyle: .Alert)
        presentViewController(alertViewSignin, animated: true, completion: nil)
        delay(2, { () -> () in
            //Seque to Intro
            alertViewSignin.dismissViewControllerAnimated(true, completion: {
                self.performSegueWithIdentifier("signOutSegue", sender: nil)
            })
        })
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
