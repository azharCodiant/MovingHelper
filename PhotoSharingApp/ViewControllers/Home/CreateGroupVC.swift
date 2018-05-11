//
//  CreateGroupVC.swift
//  PhotoSharingApp
//
//  Created by Azharuddin on 01/02/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {

    @IBOutlet weak var groupNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.title = "Name This Group"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(addTapped))
        self.groupNameTF.becomeFirstResponder()
    }

    @objc func addTapped() {
        self.navigationController?.popViewController(animated: true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
