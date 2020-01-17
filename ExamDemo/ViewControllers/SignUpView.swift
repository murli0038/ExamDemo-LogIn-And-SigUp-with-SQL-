//
//  SignUpView.swift
//  ExamDemo
//
//  Created by Nikunj Prajapati on 03/01/20.
//  Copyright © 2020 Nikunj Prajapati. All rights reserved.
//

import UIKit

class SignUpView: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    
    var db = DBmanage()
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var userEmailText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var userCityText: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(signUpBtn)
        Utilities.styleTextField(userNameText)
        Utilities.styleTextField(userPasswordText)
        Utilities.styleTextField(userEmailText)
        Utilities.styleTextField(userCityText)
        userImage.layer.borderWidth = 1
        userImage.layer.borderColor = UIColor.systemTeal.cgColor
        
        self.cityPicker.delegate=self
        self.cityPicker.dataSource=self

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //code for selection of gender
    var arrGender = ["Male","Female","Other"]
    
    @IBAction func signUpBtnTapped(_ sender: Any)
    {
        let Gender = arrGender[segmentControl.selectedSegmentIndex]
        
        let UserImage = userImage.image!.jpegData(compressionQuality: 1.0)
        let strBase64 = UserImage?.base64EncodedString(options: .lineLength64Characters)
        
        
        let command = "INSERT INTO UserTable (username,useremailid,userpassword,usercity,xender,image) VALUES('\(userNameText.text!)','\(userEmailText.text!)','\(String(describing: userPasswordText.text!))','\(userCityText.text!)','\(Gender)','\(strBase64!)')"
        if db.RunCommand(cmd: command)
        {
            print("Data Saved!")
            
            let alert = UIAlertController(title: "Sign Up", message: "Your data in saved Succefully", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            print("Not Saved!")
        }
    }
    
    
    // code for pickerview which has city name
    var cities = ["Ahmedabad","Amreli district","Anand","Banaskantha","Bharuch","Bhavnagar","Dahod","The Dangs","Gandhinagar","Jamnagar","Junagadh","Kutch","Kheda","Mehsana","Narmada","Navsari","Patan","Panchmahal","Porbandar","Rajkot","Sabarkantha","Surendranagar","Surat","Vyara","Vadodara","Valsad"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return cities.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return cities[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        userCityText.text = cities[row]
    }
    
    
    // code for pick image from the photos
    
    var imgPicker = UIImagePickerController()
    
    @IBAction func PickImageGestureTapped(_ sender: UITapGestureRecognizer)
    {
        imgPicker = UIImagePickerController()
        imgPicker.sourceType = .photoLibrary
            
            
        imgPicker.delegate = self
        
            //self.navigationController?.pushViewController(imgPicker, animated: true)
        self.present(imgPicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        let PickedImage = info[.originalImage] as! UIImage
        
            userImage.contentMode = .scaleAspectFill
            userImage.image = PickedImage
        
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        //self.navigationController?.popViewController(animated: true)//.pop(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
}
