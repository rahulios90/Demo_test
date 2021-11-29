//
//  ImageDownloadManager.swift
//  SampleBayut
//
//  Created by OfficeUser on 28/11/21.
//

import UIKit

class ImageDownloadManager: NSObject {

    static let sharedInstance = ImageDownloadManager()
    var imageCache:NSCache<NSString, UIImage>
    
    
    override init() {
        
        self.imageCache = NSCache()
    }
    
    func getImage(forUrl url:String) -> UIImage? {
        return self.imageCache.object(forKey: url as NSString)
    }
    
    func setImage(image:UIImage,forKey url:String) -> Void {
        self.imageCache.setObject(image, forKey: url as NSString)
    }
}
