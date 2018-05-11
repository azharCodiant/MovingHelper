//
//  NotificationCell.swift
//  PhotoSharingApp
//
//  Created by Azharuddin on 05/02/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userImg.layer.cornerRadius = self.userImg.frame.height/2
        self.userImg.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
