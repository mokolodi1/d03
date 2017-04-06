//
//  ViewController.swift
//  day03
//
//  Created by Marco BOOTH on 4/6/17.
//  Copyright © 2017 Marco BOOTH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
    @IBOutlet weak var imageCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageData.images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageSquare", for: indexPath)
        
        if let imageCell = cell as? CollectionViewCell {
            imageCell.backgroundColor = UIColor.black
            imageCell.imageInfo = ImageData.images[indexPath.row]
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("asdfasdf")
        
        if let cellSender = sender as! CollectionViewCell?,
                let destination = segue.destination as? ImageDetailController {
            if let data = cellSender.imageData {
                print("yop")
                destination.imageData = data
//                destination.viewTitle = cellSender.
            } else {
                print("data not loaded yet")
            }
        }
    }
}
