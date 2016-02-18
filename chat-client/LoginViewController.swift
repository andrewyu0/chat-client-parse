//
//  LoginViewController.swift
//  chat-client
//
//  Created by Andrew Yu on 2/17/16.
//  Copyright © 2016 Andrew Yu. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(
            emailTextField.text!,
            password: passwordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                print("Successfully logged in")

//                self.navigationController?.pushViewController(ChatViewController as! UIViewController, animated: true)
                self.performSegueWithIdentifier("ChatViewController", sender: self)
                
            } else {
                print("Error logging in")
                self.displayError(error!)
                
            }
        }        
    }
    
    @IBAction func onSignUp(sender: AnyObject) {
        let user = PFUser()
        user.password = passwordTextField.text
        user.username = emailTextField.text
        user.email = emailTextField.text
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                print("Error signing up")
                self.displayError(error)
            } else {
                print("Successfully signed up")
                // Hooray! Let them use the app now.
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayError(error: NSError){
//        let errorString = error.userInfo["error"] as? NSString
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
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
