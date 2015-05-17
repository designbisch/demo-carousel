//
//  TermsViewController.swift
//  demo-carousel
//
//  Created by Josh Bisch on 5/16/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = NSURL (string: "https://www.dropbox.com/terms?mobile=1");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dismissView (){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didPressDoneBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
