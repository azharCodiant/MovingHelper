//
//  GalleryVC.swift
//  PhotoSharingApp
//
//  Created by Manish Rathore on 2/5/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class GalleryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 24.0/255.0, green: 149.0/255.0, blue: 239.0/255.0, alpha: 1.0)
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.tabBarController?.title = "Gallery"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as! GalleryCollectionViewCell
        let name = "\(indexPath.row + 1)"
        cell.showImage.image =   UIImage(named: name)
        return cell
    }
    
    @IBAction func galleryBackBtn(_ sender: UIBarButtonItem) {
        self.tabBarController?.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - PINTEREST LAYOUT DELEGATE
extension GalleryVC : PinterestLayoutDelegate {
    
    //1. Returns the photo height
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        let name = "\(indexPath.row + 1)"
        return (UIImage(named: name)!.size.height)
    }
}

