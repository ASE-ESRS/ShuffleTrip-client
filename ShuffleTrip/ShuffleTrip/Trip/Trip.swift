//
//  Trip.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import Foundation

class Trip {
	
	var destination: String
	
	var latitude: Double
	var longitude: Double
	
	var cost: Double
	
	init(destination: String, cost: Double, latitude: Double, longitude: Double) {
		self.destination = destination
		
		self.latitude = latitude
		self.longitude = longitude
		
		self.cost = cost
	}
	
}
