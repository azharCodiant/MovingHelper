//
//  GalleryCollectionViewCell.swift
//  PhotoSharingApp
//
//  Created by Manish Rathore on 2/5/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var showImage: UIImageView!
    
    func getData(image: UIImage)  {
        showImage.image = image
    }
}
