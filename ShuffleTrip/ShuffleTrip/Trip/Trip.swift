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
	fileprivate let countryID: String
	
	lazy var countryFlag: String = {
		var flagString = ""
		for uS in countryID.uppercased().unicodeScalars {
			flagString += String(UnicodeScalar(127397 + uS.value)!)
		}
		return flagString
	}()
	
	let latLong: (Double, Double)
	
	var cost: Double
	
	var booked = false
	
	var flightTime: Date?
	
	
	
	
	// MARK: -
	
	init(countryName: String, countryID: String, latLong: (Double, Double), cost: Double) {
		self.countryName = countryName
		self.countryID = countryID
		
		self.latLong = latLong
		
		self.cost = cost * 2 // (for the return flight)
	}
	
}
