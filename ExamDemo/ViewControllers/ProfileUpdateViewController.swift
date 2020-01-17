//
//  ProfileUpdateViewController.swift
//  ExamDemo
//
//  Created by Nikunj Prajapati on 16/01/20.
//  Copyright © 2020 Nikunj Prajapati. All rights reserved.
//

import UIKit

class ProfileUpdateViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmailID: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userCity: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var segMent: UISegmentedControl!
    @IBOutlet weak var userUpdateBtn: UIButton!
    
    var db = DBmanage()
    var finalValue = [Any]()
    let arrGender = ["Male","Female","Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(userUpdateBtn)
        Utilities.styleTextField(userName)
        Utilities.styleTextField(userPassword)
        Utilities.styleTextField(userEmailID)
        Utilities.styleTextField(userCity)
        userImage.layer.borderWidth = 1
        userImage.layer.borderColor = UIColor.systemTeal.cgColor
        
        
        userName.text = finalValue[6] as? String
        userEmailID.text = finalValue[1] as? String
        userPassword.text = finalValue[2] as? String
        userCity.text = finalValue[0] as? String
      //  segMent.selectedSegmentIndex = arrGender.index(of: finalValue[4] as! String)!
        let decodedData = Data(base64Encoded: finalValue[3] as! String, options: .ignoreUnknownCharacters)
        let decodedImage = UIImage(data: decodedData!)
        userImage.image = decodedImage

        // Do any additional setup after loading the view.
    }
    @IBAction func updateProfileTapped(_ sender: Any)
    {
        let Gender = arrGender[segMent.selectedSegmentIndex]
        
        //code for modification of user data
        let imgData = userImage.image!.jpegData(compressionQuality: 1.0)!
        let strBase64 = imgData.base64EncodedString(options: .lineLength64Characters)
        let updateText = "UPDATE UserTable SET username = '\(userName.text!)', useremailid = '\(userEmailID.text!)', userpassword = '\(userPassword.text!)', usercity = '\(userCity.text!)', xender = '\(Gender)', image = '\(strBase64)' WHERE userid = \(finalValue[5])"
        
        if(db.RunCommand(cmd: updateText))
        {
            print("\n\n\tExecuted!")
            let alert = UIAlertController.init(title: "Success", message: "You updated successfuly, you can now login with these details", preferredStyle: .alert)
            let continueAction = UIAlertAction.init(title: "Continue", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            })
            alert.addAction(continueAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            print("\n\n\t\tError!")
            let alert = UIAlertController.init(title: "Error", message: "Some mistake has occurred, please try again", preferredStyle: .alert)
            let continueAction = UIAlertAction.init(title: "Continue", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(continueAction)
            self.present(alert, animated: true, completion: nil)
            
        }
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
