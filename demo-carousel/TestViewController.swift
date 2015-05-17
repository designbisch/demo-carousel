//
//  TestViewController.swift
//  demo-carousel
//
//  Created by Josh Bisch on 5/16/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var topNavigation: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = NSURL (string: "https://www.dropbox.com/terms");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "barButtonItemClicked:"), animated: true)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
