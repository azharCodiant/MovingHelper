//
//  FeedsVC.swift
//  PhotoSharingApp
//
//  Created by Manish Rathore on 2/6/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit
let offset_HeaderStop:CGFloat = 64.0 // At this offset the Header stops its transformations

class FeedsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var header: UIView!
    @IBOutlet weak var lblGroupName: UILabel!
    @IBOutlet weak var btnEditCoverPhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 24.0/255.0, green: 149.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tabBarController?.title = "Friends"
        //self.tabBarController?.tabBar.isHidden = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        animationForScroll(offset: offset)
    }
    
    func animationForScroll(offset : CGFloat)  {
        var headerTransform = CATransform3DIdentity
        if offset < 0 {
            let headerScaleFactor:CGFloat = -(offset) / header.bounds.height
            let headerSizevariation = ((header.bounds.height * (1.0 + headerScaleFactor)) - header.bounds.height)/2.0
            headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
        } else {
            
            // Header -----------
            headerTransform = CATransform3DTranslate(headerTransform, 0, max(-offset_HeaderStop, -offset), 0)
            
            //  ------------ Label Alpha
            lblGroupName?.alpha = min (1.0, -(offset - 150)/150)
            btnEditCoverPhoto?.alpha = min (1.0, -(offset - 150)/150)
            
        }
        // Apply Transformations
        header.layer.transform = headerTransform
    }
    
    @IBAction func groupBackBtn(_ sender: UIBarButtonItem) {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func InvitePeople_Action(_ sender: UIBarButtonItem) {
        let InvitePeopleTVC = storyboard?.instantiateViewController(withIdentifier: "InvitePeopleTVC") as! InvitePeopleTVC
        navigationController?.pushViewController(InvitePeopleTVC, animated: true)
    }
}

extension FeedsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsCell", for: indexPath) as! FeedsCell
        cell.lblTime.text = "\(indexPath.row + 1) hours ago"
        return cell
    }
}
