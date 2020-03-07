//
//  UserTableCell.swift
//  GSBaseMVVM
//
//  Created by Gati Shah on 07/03/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class UserTableCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var labelID : UILabel!
    @IBOutlet weak var labelUserID : UILabel!
    @IBOutlet weak var labelTitle : UILabel!
    @IBOutlet weak var labelDesc : UILabel!
    
    //MARK:- Variable
    var userData : User? {
        didSet {
            setUpData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Custom Methods
    func setUpData() {
        labelID.text = "\(userData?.id ?? 0)"
        labelUserID.text = "\(userData?.userId ?? 0)"
        labelTitle.text = userData?.title
        labelDesc.text = userData?.body
    }
    
}
