//
//  PhotosViewController.swift
//  Photorama
//
//  Created by SB on 1/2/19.
//  Copyright © 2019 SB. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
        updateDataSource()
        
        store.fetchInterestingPhotos {
            (photosResult) -> Void in
            
           self.updateDataSource()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let photo = photoDataSource.photos[indexPath.row]
        
        // Download the image data, which could take some time
        store.fetchImage(for: photo) { (result) -> Void in
            
            // The index path for the photo might have changed between the
            // time the request started and finished, so find the most
            // recent index path
            
            guard let photoIndex = self.photoDataSource.photos.index(of: photo),
                case let .success(image) = result else {
                    return
            }
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
            
            // When the request finishes, only update the cell if it's still visible
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                cell.update(with: image)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showPhoto"?:
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                
                let photo = photoDataSource.photos[selectedIndexPath.row]
                
                let destinationVC = segue.destination as! PhotoInfoViewController
                destinationVC.photo = photo
                destinationVC.store = store
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth: CGFloat = view.bounds.width
        let minInterItemSpacing: CGFloat = 2
        let leftInsetSpacing: CGFloat = 2
        let rightInsetSpacing: CGFloat = 2
        let availableWidth: CGFloat = (screenWidth - leftInsetSpacing - rightInsetSpacing - (minInterItemSpacing*3))/4
        print("screenwidth: \(screenWidth) availableWidth: \(availableWidth) ")
        let itemSize = CGSize(width: availableWidth, height: availableWidth)
        return itemSize
    }
    
    private func updateDataSource() {
        store.fetchAllPhotos { (photoResult) in
            
            switch photoResult {
            case let .success(photos):
                self.photoDataSource.photos = photos
            case .failure:
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
}
