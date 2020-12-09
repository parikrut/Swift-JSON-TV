//
//  CityObject.swift
//  FinalExamTv
//
//  Created by Xcode User on 2020-12-08.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CityObject: NSObject ,NSCoding{
    var CityName : String?
    var Latitude : String?
    var Longitude : String?
    var Population : String?
    
    
    func initWithData( CityName:String,
                       Latitude:String,
                       Longitude:String,
                       Population:String)
    {
        
        self.CityName = CityName
        self.Latitude = Latitude
        self.Longitude = Longitude
        self.Population = Population
        
    }
    
    // step 3c -> create these two methods Population handle serialization of data between
    // phone and watch.
    required convenience init?(coder decoder: NSCoder) {
        
        guard let CityName = decoder.decodeObject(forKey: "CityName") as? String,
            let Latitude = decoder.decodeObject(forKey: "Latitude") as? String,
            let Longitude = decoder.decodeObject(forKey: "Longitude") as? String,
            let Population = decoder.decodeObject(forKey: "Population") as? String
            
            else { return nil }
        
        
        // note this will cause crash if its not in here exactly as is
        self.init()
        self.initWithData(
            CityName: CityName as String,
            Latitude: Latitude as String,
            Longitude : Longitude as String,
            Population : Population as String
        )
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.CityName, forKey: "CityName")
        coder.encode(self.Latitude, forKey: "Latitude")
        coder.encode(self.Longitude, forKey: "Longitude")
        coder.encode(self.Population, forKey: "Population")
        
        
    }
}


