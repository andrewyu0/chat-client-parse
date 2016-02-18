//
//  ChatViewController.swift
//  chat-client
//
//  Created by Andrew Yu on 2/17/16.
//  Copyright © 2016 Andrew Yu. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBAction func submitMessageAction(sender: AnyObject) {
        
        var Message_iOSFeb2016 = PFObject(className:"Message_iOSFeb2016")

        Message_iOSFeb2016["text"] = messageTextField.text
        
        Message_iOSFeb2016.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
                print("Successfully sent message")
            } else {
                // There was a problem, check error.description
                print("nahhhh error")
            }
        }
        
        
    }
    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return 1
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//        
//    }
//    
//    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        
        var query = PFQuery(className:"Message_iOSFeb2016")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        print(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
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
