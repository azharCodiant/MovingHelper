//
//  KingfisherHelper.swift
//
//  - Copyright (c) 2017 Utkarsh Singh. All rights reserved.
//

import Foundation
import Kingfisher


struct KingfisherHelper {
    
    static func configure(maxCacheSize: UInt, maxCachePeriod: TimeInterval) {
        ImageCache.default.maxDiskCacheSize = maxCacheSize
        ImageCache.default.maxCachePeriodInSecond = maxCachePeriod
        
        KingfisherManager.shared.cache.pathExtension = "jpg"
        
    
    }
    
    static func getImage(url:URL)->Data {
        var data = Data()
        KingfisherManager.shared.retrieveImage(with: url , options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
            print(image)
            
            data = UIImageJPEGRepresentation(image!, 1)!
            
         })
        return data
    }
}

extension UIImageView {
    
   /* func setImageForAlbum(with url: URL) {
        self.kf.indicatorType = .image(imageData: UIImagePNGRepresentation(image)!)
        self.kf.setImage(with: url)
   }*/
    func setImage(with url: URL) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
    
    func setImage(with url: URL, size: CGSize) {
        
        let processor = ResizingImageProcessor(referenceSize: size, mode: .aspectFill)
        
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url, options: [.processor(processor)])
    }
    func cancelDownload() {
    
        self.kf.cancelDownloadTask()
    }
}

