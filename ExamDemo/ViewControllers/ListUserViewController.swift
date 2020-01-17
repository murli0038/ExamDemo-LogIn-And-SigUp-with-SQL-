//
//  ListUserViewController.swift
//  ExamDemo
//
//  Created by Nikunj Prajapati on 06/01/20.
//  Copyright © 2020 Nikunj Prajapati. All rights reserved.
//

import UIKit

class ListUserViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListUserTableViewCell
        cell.userName.text = arr[indexPath.row]["Name"]
        cell.userEmailID.text = arr[indexPath.row]["Email"]
        cell.userCity.text = arr[indexPath.row]["City"]
        return cell
        
    }
    
    
    var arr = [["Name":"Nikunj","Email":"n@gmail.com","City":"Mansa"],
                   ["Name":"Yogesh","Email":"y@gmail.com","City":"America"],
                   ["Name":"Priyaben","Email":"p@gmail.com","City":"Gandhinagar"],
                   ["Name":"Tanvi","Email":"t@gmail.com","City":"Himmatnagar"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
