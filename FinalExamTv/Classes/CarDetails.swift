//
//  CarDetails.swift
//  FinalExamTv
//
//  Created by Xcode User on 2020-12-08.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CarDetails: NSObject {
    
    // step 3b define arrays & add images to project
    let cars = ["hondacity.png", "bmws7.png", "audia8.png"]
    
    let carNames = ["Honda City", "BMW s7", "Audi A8"]
    
    let cityLatLong = "http://parikrut.dev.fast.sheridanc.on.ca/myCar/sqlToJson.php" as String
    
    // step 3c create variables to hold resulting weather data
    var Make: String = ""
    var Model: String  = ""
    var Year: String = ""
    var Color: String = ""
    var NewOrUsed: String = ""
    var Price: String = ""

    
    // step 3d create method below to retrieve JSON weather
    func getDataFromJson( selected : Int)
    {

        if let url = NSURL(string: cityLatLong) {
            // retrieve json data from url
            if let data = NSData(contentsOf: url as URL){
                do {

                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! AnyObject
                    // retrieve dictionary for current forecast
                    let newDict = parsed as? NSArray
                   // print(newDict)

                    let cityForecast = newDict![selected] as! NSDictionary
                    
                    Make = "\(cityForecast["Make"]!)"
                    Model = "\(cityForecast["Model"]!)"
                    Year = "\(cityForecast["Year"]!)"
                    Color = "\(cityForecast["Color"]!)"
                    NewOrUsed = "\(cityForecast["NewOrUsed"]!)"
                    Price = "\(cityForecast["Price"]!)"
                }
                catch let error as NSError {
                    //print("A JSON parsing error occurred, here are the details:\n \(error)")
                    Make = "A JSON parsing error occurred, here are the details: "
                    Model = error.description
                    
                }
            }
        }
        
    }
    
}
