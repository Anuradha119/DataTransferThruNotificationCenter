//
//  ViewController.swift
//  DataTransferThruNotificationCenter
//
//  Created by Marni Anuradha on 11/23/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var mobileNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(eventHandler), name: NSNotification.Name("OnSubmit"), object: nil)
    }
    
    @IBAction func onAddContactBtnTap(_ sender: UIButton) {
        
        var secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        
        present(secondVC, animated: true, completion: nil)
    }
    
    @objc func eventHandler(data:Notification)
    {
        
        
        nameLabel.text = data.userInfo!["Name"]! as! String
        mobileNumberLabel.text = data.userInfo!["MobileNumber"]! as! String
        
    }
}

