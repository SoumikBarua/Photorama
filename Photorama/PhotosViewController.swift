//
//  PhotosViewController.swift
//  Photorama
//
//  Created by SB on 1/2/19.
//  Copyright © 2019 SB. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos()
    }
}
