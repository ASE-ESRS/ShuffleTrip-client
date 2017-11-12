//
//  Trip.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import Foundation

class Trip {
	
	let countryName: String
	let countryID: String
	
	lazy var countryFlag: String = {
		var flagString = ""
		for uS in countryID.uppercased().unicodeScalars {
			flagString += String(UnicodeScalar(127397 + uS.value)!)
		}
		return flagString
	}()
	
	let airportName: String
	let airportID: String
	
	let airportCoordinates: (longitude: String, latitude: String)
	let airportCity: String
	
	var cost: Double
	
	
	
	
	// MARK: -
	
	init(countryName: String, countryID: String, airportName: String, airportID: String, airportCoordinates: (longitude: String, latitude: String), airportCity: String, cost: Double) {
		self.countryName = countryName
		self.countryID = countryID
		
		self.airportName = airportName
		self.airportID = airportID
		
		self.airportCoordinates = airportCoordinates
		self.airportCity = airportCity
		
		self.cost = cost
	}
	
}
