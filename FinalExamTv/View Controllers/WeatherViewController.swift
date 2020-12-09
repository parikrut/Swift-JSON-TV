//
//  WeatherViewController.swift
//  FinalExamTv
//
//  Created by Xcode User on 2020-12-08.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class WeatherViewController: UIViewController,MKMapViewDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet var myMapView : MKMapView!


    @IBOutlet var imgCity : UIImageView!
    @IBOutlet var lblCity : UILabel!
    @IBOutlet var lblTemperature : UILabel!
    @IBOutlet var lblSummary : UILabel!
    let cityData = CityDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateWeather(select: 0)

        // Do any additional setup after loading the view.
    }
    func updateWeather(select : Int)
    {
        imgCity.image = UIImage(named: cityData.cities[select])
        lblCity.text = cityData.cityNames[select]
        cityData.getDataFromJson(selected: select)
        
        lblSummary.text = "\(cityData.title) population: \(cityData.summary)"
        
        let latitude = Double(cityData.latitude)!
        let longitute = Double(cityData.longitude)!
        
        let coordinate = CLLocationCoordinate2DMake(latitude, longitute)
        self.myMapView.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = coordinate
        dropPin.title = "\(cityData.title)"
        self.myMapView.addAnnotation(dropPin)
        self.myMapView.selectAnnotation(dropPin, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
