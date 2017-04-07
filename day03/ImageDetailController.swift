//
//  ImageDetailController.swift
//  day03
//
//  Created by Teo FLEMING on 4/6/17.
//  Copyright © 2017 Marco BOOTH. All rights reserved.
//

import UIKit

class ImageDetailController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView : UIImageView?
    
    var imageData : Data?
    
    var viewTitle : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = imageData, let newTitle = viewTitle {
            self.title = newTitle
            
            imageView = UIImageView(image: UIImage(data: data))
            
            if let imageView = imageView {
                print("adding subview")
                self.scrollView.addSubview(imageView)
                self.scrollView.contentSize = imageView.frame.size
            }
        }
    }
    
    private func updateMinZoomScaleForSize(size: CGSize) {
        print("in updateMinZoomScale")
        if let imageView = imageView {
            let widthScale = size.width / imageView.bounds.width
            let heightScale = size.height / imageView.bounds.height
            let minScale = min(widthScale, heightScale)
            
            print("changing minimumZoomScale")
            scrollView.minimumZoomScale = minScale
            
            scrollView.zoomScale = minScale
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
        
        updateMinZoomScaleForSize(size: scrollView.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
