//
//  LogInView.swift
//  ExamDemo
//
//  Created by Nikunj Prajapati on 03/01/20.
//  Copyright © 2020 Nikunj Prajapati. All rights reserved.
//

import UIKit

class LogInView: UIViewController {
    
    var value = [Any]()
    var db = DBmanage()

    @IBOutlet weak var logEmailText: UITextField!
    @IBOutlet weak var logPasswrodText: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var newUserBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleTextField(logEmailText)
        Utilities.styleTextField(logPasswrodText)
        Utilities.LogInHollowButton(LoginBtn)
        Utilities.newUserBtn(newUserBtn)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LogInBtnTapped(_ sender: Any)
    {
       if (logEmailText.text != "" && logPasswrodText.text != "") {
           let queryTxt = "SELECT * from UserTable where useremailid = \"\(logEmailText.text!)\" AND userpassword = \"\(logPasswrodText.text!)\""
           
           let id = db.RunQuery(query: queryTxt)
           //print(id.count)
           
           if (id.count == 0){
               let alert = UIAlertController.init(title: "Error", message: "Details not found, please try again or register a new user!", preferredStyle: .alert)
               let continueAction = UIAlertAction.init(title: "Continue", style: .default, handler: { (alert) in
                   self.dismiss(animated: true, completion: nil)
               })
               alert.addAction(continueAction)
               self.present(alert, animated: true, completion: nil)
               return
           }
           
           for key in id[0].keys {
               //print(id[key]!)
               self.value.append(id[0][key]!)
               //self.value.append(id[key]!)
           }
       }
       else
       {
           print("\n\n\t\tError!")
           let alert = UIAlertController.init(title: "Error", message: "Please enter Username and Password..!", preferredStyle: .alert)
           let continueAction = UIAlertAction.init(title: "Continue", style: .default, handler: { (alert) in
               self.dismiss(animated: true, completion: nil)
           })
           alert.addAction(continueAction)
           self.present(alert, animated: true, completion: nil)
       }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ProfileUpdateViewController
        vc?.finalValue = value
    }
}
