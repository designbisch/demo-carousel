//
//  CreateViewController.swift
//  demo-carousel
//
//  Created by Josh Bisch on 5/16/15.
//  Copyright (c) 2015 designbisch. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldsView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var termsView: UIView!
    
    var fieldsDown: CGFloat!
    var fieldsUp: CGFloat!
    var buttonDown: CGFloat!
    var buttonUp: CGFloat!
    
    let animation = CABasicAnimation(keyPath: "position")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldsDown = fieldsView.center.y
        fieldsUp = fieldsView.center.y - 90
        buttonDown = buttonView.center.y
        buttonUp = buttonView.center.y - 60
        
        animation.duration = 0.12
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(CGPoint: CGPointMake(termsView.center.x - 10, termsView.center.y))
        animation.toValue = NSValue(CGPoint: CGPointMake(termsView.center.x + 10, termsView.center.y))
        
        scrollView.contentSize = fieldsView.frame.size
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.fieldsView.center.y = self.fieldsUp
            self.buttonView.center.y = self.buttonUp
            
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
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.fieldsView.center.y = self.fieldsDown
            self.buttonView.center.y = self.buttonDown
            
            }, completion: nil)
    }

    
    @IBAction func didPressCheckBox(sender: AnyObject) {
        checkButton.selected = !checkButton.selected
    }
    
    //Tapping out of form dismisses keyboard + moves to bottomPosition
    @IBAction func didTapOut(sender: AnyObject) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
    }
    
    @IBAction func didPressCreatBtn(sender: AnyObject) {
        
        if firstNameField.text.isEmpty || lastNameField.text.isEmpty || emailField.text.isEmpty || passwordField.text.isEmpty {
            var alertView = UIAlertView(title: "Name, email & password required", message: "Please enter your full name, an email address and  a password to continue.", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
        } else if checkButton.selected == false {
            
            termsView.layer.addAnimation(animation, forKey: "position")
            
        } else {
            emailField.resignFirstResponder()
            passwordField.resignFirstResponder()
            firstNameField.resignFirstResponder()
            lastNameField.resignFirstResponder()
            
            var alertViewSignin = UIAlertController(title: "Creating Account...", message: nil, preferredStyle: .Alert)
            presentViewController(alertViewSignin, animated: true, completion: nil)
            delay(2, { () -> () in
                //Seque to tutorial
                alertViewSignin.dismissViewControllerAnimated(true, completion: {
                    self.performSegueWithIdentifier("tutorialSegue", sender: self)
                })
                
            })
            
            }
        }
    
    @IBAction func didPressBackBtn(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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
    



