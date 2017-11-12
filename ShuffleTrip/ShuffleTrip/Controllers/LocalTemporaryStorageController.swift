//
//  LocalTemporaryStorageController.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 12/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import Foundation

class LocalTemporaryStorageController {
	
	static let shared = LocalTemporaryStorageController()
	
	public var trips = [Trip]()
	
}
