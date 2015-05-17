//
//  SignInViewController.swift
//  demo-carousel
//
//  Created by Joshua Bisch on 5/13/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var btnsView: UIView!
    @IBOutlet weak var fieldsView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    var fieldsDown: CGFloat!
    var fieldsUp: CGFloat!
    var btnsDown: CGFloat!
    var btnsUp: CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldsDown = fieldsView.center.y
        fieldsUp = fieldsView.center.y - 100
        btnsDown = btnsView.center.y
        btnsUp = btnsView.center.y - 225
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackBtn(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // Pull data from keyboard show event
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.fieldsView.center.y = self.fieldsUp
            self.btnsView.center.y = self.btnsUp
            
            }, completion: nil)
    }
    
    // Pull data from keyboard hide event
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.fieldsView.center.y = self.fieldsDown
            self.btnsView.center.y = self.btnsDown
            
            }, completion: nil)
    }

    
    //Tapping out of form dismisses keyboard + moves to bottomPosition
    @IBAction func didTapOut(sender: AnyObject) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @IBAction func didTapSignin(sender: AnyObject) {
        
        if emailField.text.isEmpty || passwordField.text.isEmpty {
            var alertView = UIAlertView(title: "Email & Password Required", message: "Please enter an email address and password to continue.", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            if emailField.text == "josh@email.com" && passwordField.text == "password" {
                //println("email and pass are good")
                
                emailField.resignFirstResponder()
                passwordField.resignFirstResponder()
                
                var alertViewSignin = UIAlertController(title: "Signing in...", message: nil, preferredStyle: .Alert)
                presentViewController(alertViewSignin, animated: true, completion: nil)
                
                delay(2, { () -> () in
                    //Seque to tutorial
                    alertViewSignin.dismissViewControllerAnimated(true, completion: {
                        
                        self.performSegueWithIdentifier("signinSegue", sender: self)
                    })
                    
                })
                
            } else {
                var alertViewSignin = UIAlertController(title: "Signing in...", message: nil, preferredStyle: .Alert)
                presentViewController(alertViewSignin, animated: true, completion: nil)
                
                delay(2, { () -> () in
                    alertViewSignin.dismissViewControllerAnimated(true, completion: {
                        var alertView = UIAlertView(title: "Incorrect Email & Password", message: "Please enter a valid email address and password to continue.", delegate: self, cancelButtonTitle: "OK")
                        alertView.show()
                    })
                    
                })
            }
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
