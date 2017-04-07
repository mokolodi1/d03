//
//  CollectionViewCell.swift
//  day03
//
//  Created by Marco BOOTH on 4/6/17.
//  Copyright © 2017 Marco BOOTH. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var activityMonitor: UIActivityIndicatorView!
    
    var imageData : Data?
    var detailTitle : String?
    
    var imageInfo : (String, String)? {
        willSet {
            self.activityMonitor.startAnimating()
        }
        didSet {
            if let url = imageInfo?.1 {
                let requestUrl = URL(string: url)
                let queue = DispatchQueue.global(qos: DispatchQoS.background.qosClass)
                
                queue.async {
                    if let data = try? Data(contentsOf: requestUrl!) {
                        DispatchQueue.main.async {
                            self.collectionImage.image = UIImage(data: data)
                            self.collectionImage.backgroundColor = UIColor.white
                        }
                        
                        self.imageData = data
                        self.detailTitle = self.imageInfo?.0
                    } else {
                        let alert = UIAlertController(title: "Error", message: "Failed to load image: \(url)", preferredStyle: UIAlertControllerStyle.alert)

                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    
                        self.parentViewController?.present(alert, animated: true, completion: nil)
                    }
                    
                    DispatchQueue.main.async {
                        self.activityMonitor.stopAnimating()
                    }
                    
                    ImageData.loadedCount += 1
                    if ImageData.loadedCount == ImageData.images.count {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    }
                }
            }
        }
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self

        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as! UIViewController!
            }
        }
        return nil
    }
}
