//
//  CustomTabbarVC.swift
//  PhotoSharingApp
//
//  Created by Azharuddin on 08/02/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class CustomTabbarVC: UITabBarController,UITabBarControllerDelegate {

    let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarController?.delegate = self
         setupMiddleButton()
    }

    func setupMiddleButton() {
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        
        menuButton.backgroundColor = UIColor(red: 24/255.0, green: 149/255.0, blue: 239/255.0, alpha: 1.0)
        view.addSubview(menuButton)
        
        menuButton.setImage(UIImage(named: "plusIcon"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        
        view.layoutIfNeeded()
    }
    
    func hideCenterButton(){
        self.menuButton.isHidden = true
    }
    
    func showCenterButton(){
        self.menuButton.isHidden = false
    }
    
    // MARK: - Actions
    
    @objc private func menuButtonAction(sender: UIButton) {
        //selectedIndex = 2
        print("select index 2")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "SelectPhotosVC") as? SelectPhotosVC {
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    
   
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Test")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
