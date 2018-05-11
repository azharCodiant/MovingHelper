//
//  LoginVC.swift
//  PhotoSharingApp
//
//  Created by Azharuddin on 30/01/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 24.0/255.0, green: 149.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.topItem?.title = " ";
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !(self.navigationController!.navigationBar.isHidden) {
          self.navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAcc_Action(_ sender: UIButton) {
        let CreateAccTVC = storyboard?.instantiateViewController(withIdentifier: "CreateAccTVC") as! CreateAccTVC
        navigationController?.pushViewController(CreateAccTVC, animated: true)
    }
    
    @IBAction func LoginAcc_Action(_ sender: UIButton) {
        let ExistingLoginTVC = storyboard?.instantiateViewController(withIdentifier: "ExistingLoginTVC") as! ExistingLoginTVC
        navigationController?.pushViewController(ExistingLoginTVC, animated: true)
    }
    
}
