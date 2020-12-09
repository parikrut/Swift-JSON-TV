//
//  CityDetails.swift
//  FinalExamTv
//
//  Created by Xcode User on 2020-12-08.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CityDetails: NSObject {
    
    // step 3b define arrays & add images to project
    let cities = ["toronto.jpg", "montreal.jpg", "vancouver.jpg", "ahmedabad.jpg", "nyc.jpg"]
    
    let cityNames = ["Toronto", "Montreal", "Vancouver", "Ahmedabad", "New York City"]
    
    let cityLatLong = "http://parikrut.dev.fast.sheridanc.on.ca/myCar/sqlToJsonCity.php" as String
    
    // step 3c create variables to hold resulting weather data
    var title : String = ""
    var summary : String = ""
    var latitude: String = ""
    var longitude: String = ""
    
    // step 3d create method below to retrieve JSON weather
    func getDataFromJson( selected : Int)
    {
        // define url object based on weather url
        if let url = NSURL(string: cityLatLong) {
            // retrieve json data from url
            if let data = NSData(contentsOf: url as URL){
                do {
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! AnyObject
                    // retrieve dictionary for current forecast
                    let newDict = parsed as? NSArray
                    // print(newDict)
                    
                    let cityForecast = newDict![selected] as! NSDictionary
                   
                    title = "\(cityForecast["CityName"]!)"
                    
                    latitude = "\(cityForecast["Latitude"]!)"

                    longitude = "\(cityForecast["Longitude"]!)"
                    
                    summary = "\(cityForecast["Population"]!)"
                    // self.showAlert(status: summary, title: title)
                }
                catch let error as NSError {
                    //print("A JSON parsing error occurred, here are the details:\n \(error)")
                    title = "A JSON parsing error occurred, here are the details: "
                    summary = error.description
                    latitude = error.description
                    longitude = error.description
                }
            }
        }
        
    }
    
}

