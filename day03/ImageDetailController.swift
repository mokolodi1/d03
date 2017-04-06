//
//  ImageDetailController.swift
//  day03
//
//  Created by Teo FLEMING on 4/6/17.
//  Copyright © 2017 Marco BOOTH. All rights reserved.
//

import UIKit

class ImageDetailController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageData : Data? {
        didSet {
            if let data = imageData {
                print("data:", data)
                print("imageView:", imageView)
                imageView.image = UIImage(data: data)
            } else {
                print("data is nil :'(")
            }
        }
    }
    
    var viewTitle : String? {
        didSet {
            self.title = viewTitle
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
