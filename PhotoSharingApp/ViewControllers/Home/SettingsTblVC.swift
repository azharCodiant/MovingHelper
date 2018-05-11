//
//  SettingsTblVC.swift
//  PhotoSharingApp
//
//  Created by Manish Rathore on 2/6/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class SettingsTblVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Logout_Action(_ sender: UIButton) {
        logoutConfirmation {
            AppDelegate.setRootController()
            //self.navigationController?.popToRootViewController(animated: true)
        }
    }
    fileprivate func logoutConfirmation(handler: @escaping() -> Void) {
        
        let alertController = UIAlertController(title: "Log Out", message: "Are you sure, you want to Log Out?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Stay In", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (action) in
            handler()
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 5
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        switch section {
//        case 0:
//            return 1
//        case 1:
//            return 1
//        case 2:
//            return 2
//        case 3:
//            return 2
//        case 4:
//            return 1
//        default:
//            print("switch")
//        }
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        switch indexPath.section {
//        case 0:
//            print("switch")
//        case 1:
//            print("switch")
//        case 2:
//            print("switch")
//        case 3:
//            print("switch")
//        case 4:
//            let actionSheetController: UIAlertController = UIAlertController(title: nil, message: "Are you sure want to logout? ", preferredStyle: .actionSheet)
//
//            // create an action
//            let firstAction: UIAlertAction = UIAlertAction(title: "Log Out", style: .default) { action -> Void in
//
//                print("First Action pressed")
//                self.navigationController?.popToRootViewController(animated: true)
//                AppDelegate.setRootController()
//            }
//
//            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
//
//            // add actions
//            actionSheetController.addAction(firstAction)
//            actionSheetController.addAction(cancelAction)
//
//            // present an actionSheet...
//            present(actionSheetController, animated: true, completion: nil)
//
//        default:
//            print("switch")
//        }
//    }
    
}
