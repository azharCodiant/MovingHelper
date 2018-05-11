//
//  GroupsVC.swift
//  PhotoSharingApp
//
//  Created by Manish Rathore on 2/6/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Photo Sharing"
        let testUIBarButtonItem = UIBarButtonItem(image: UIImage(named: "user"), style: .plain, target: self, action: #selector(GroupsVC.clickButton))
        self.navigationItem.leftBarButtonItem  = testUIBarButtonItem
    }
    
    @objc func clickButton(){
        let SettingsTblVC = storyboard?.instantiateViewController(withIdentifier: "SettingsTblVC") as! SettingsTblVC
        navigationController?.pushViewController(SettingsTblVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell") as! GroupsCell
        return cell
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier:"TabbarController", sender: self)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    @IBAction func createGroup_Action(_ sender: UIButton) {
        let createGroupVC = storyboard?.instantiateViewController(withIdentifier: "CreateGroupVC") as! CreateGroupVC
        self.navigationController?.pushViewController(createGroupVC, animated: true)
    }
    
}
