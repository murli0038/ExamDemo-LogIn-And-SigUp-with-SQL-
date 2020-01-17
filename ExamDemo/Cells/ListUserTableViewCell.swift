//
//  ListUserTableViewCell.swift
//  ExamDemo
//
//  Created by Nikunj Prajapati on 06/01/20.
//  Copyright © 2020 Nikunj Prajapati. All rights reserved.
//

import UIKit

class ListUserTableViewCell: UITableViewCell
{
    
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userEmailID: UILabel!
    
    @IBOutlet weak var userCity: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
