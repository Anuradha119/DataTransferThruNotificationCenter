//
//  SecondViewController.swift
//  DataTransferThruNotificationCenter
//
//  Created by Marni Anuradha on 11/23/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    var alertController:UIAlertController!
    var alertAction:UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    nameTextField.delegate = self
    mobileNumberTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSubmitBtnTap(_ sender: UIButton) {
        if((nameTextField.text?.isEmpty)! || (mobileNumberTextField.text?.isEmpty)!){
            getAlert(titleName: "OK", messageDetails: "Enter All Details")
            
        }else
        {
            
            let dataDict = ["Name":nameTextField.text!,"MobileNumber":mobileNumberTextField.text!]
            
            NotificationCenter.default.post(name: NSNotification.Name("OnSubmit"), object: self, userInfo: dataDict)
            
            dismiss(animated: true, completion: nil)
        }
        
    }
    func getAlert(titleName:String,messageDetails:String){
        
        alertController = UIAlertController(title: titleName, message: messageDetails, preferredStyle: UIAlertController.Style.alert)
        alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    // SHOULD BEGIN EDITING
    var returnVal:Bool = false
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        if(textField == nameTextField)
        {
            returnVal = true
        }
        else if(textField == mobileNumberTextField)
        {
            if(nameTextField.text!.count>=2)
            {
                returnVal = true
            }else
            {
                returnVal = false
            }
        }
        return returnVal
        
    }
    //  DELEGATES FOR NAME
    
    func isValidForAlphabets(alphabets:String) -> Bool {
        let RegEx = "[A-Za-z ]{2,25}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: alphabets)
    }
    // PHONE NUMBER
    
    func isValidForNumbers(numbers:String) -> Bool {
        let RegEx = "[0-9 ]{2,10}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: numbers)
    }
    
    
    // SHOULD END EDITING
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        textField.backgroundColor=UIColor.yellow
        
        if(textField==nameTextField)
        {
            returnVal = isValidForAlphabets(alphabets: textField.text!)
        }
        if(textField==mobileNumberTextField)
        {
            returnVal = isValidForNumbers(numbers: textField.text!)
        }
        return returnVal
    }
    


    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
