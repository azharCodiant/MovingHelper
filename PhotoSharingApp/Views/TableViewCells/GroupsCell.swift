//
//  GroupsCell.swift
//  PhotoSharingApp
//
//  Created by Manish Rathore on 2/6/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class GroupsCell: UITableViewCell {
    @IBOutlet weak var imgViewBanner: UIImageView!
    @IBOutlet weak var lblGroupName: UILabel!
    @IBOutlet weak var lblPostCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgViewBanner.layer.cornerRadius = 5
        imgViewBanner.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
