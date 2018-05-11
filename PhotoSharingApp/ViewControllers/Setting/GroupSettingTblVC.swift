//
//  GroupSettingTblVC.swift
//  PhotoSharingApp
//
//  Created by Manish Rathore on 2/5/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class GroupSettingTblVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 24.0/255.0, green: 149.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tabBarController?.title = "Group Setting"
    }
    
    @IBAction func DeleteGroup_Action(_ sender: UIButton) {
        if let array = self.navigationController?.viewControllers.filter(({$0 is GroupsVC})), array.count > 0 {
            self.navigationController?.popToViewController(array[0], animated: true)
        }
    }
    
    @IBAction func groupSettingBtn(_ sender: UIBarButtonItem) {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
}
