//
//  TagsViewController.swift
//  Photorama
//
//  Created by SB on 1/11/19.
//  Copyright © 2019 SB. All rights reserved.
//

import UIKit
import CoreData


class TagsViewController: UITableViewController {
    
    var photoStore: PhotoStore!
    var photo: Photo!
    
    var selectedPathIndex = [IndexPath]()
    
    let tagDataSource = TagDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = tagDataSource
    }
}
