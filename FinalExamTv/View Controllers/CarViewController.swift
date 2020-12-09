//
//  CarViewController.swift
//  FinalExamTv
//
//  Created by Xcode User on 2020-12-08.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

//    let cityData = CityDetails()
    let carData = CarDetails()
    @IBOutlet var collectionView1: UICollectionView!
    let reuseIdentifier = "FeaturedCell"
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 50.0)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if (collectionView == self.collectionView1)
        {
            return carData.cars.count
            
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.collectionView1)
        {
            // Step 5 create custom cell for collection view
            let cell : FeaturedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath as IndexPath) as! FeaturedCollectionViewCell
            
            let  imageFilename = carData.cars[indexPath.row]
            cell.featuredImage.image = UIImage(named: imageFilename)
            cell.lblCity.text = carData.carNames[indexPath.row]
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        carData.getDataFromJson(selected : indexPath.row)
        let alertController = UIAlertController(title: "\(carData.Make) \(carData.Model)", message: "Year - \(carData.Year) \n New or used - \(carData.NewOrUsed) \n Color - \(carData.Color) \n Price - \(carData.Price)", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alertController.addAction(cancelAction)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alertController.addAction(ok)
        
        self.present(alertController, animated: true) {
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
