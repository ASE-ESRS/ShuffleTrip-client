//
//  UserDefaultsController.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import Foundation

/// Various helper methods for saving various values (including settings).
public class UserDefaultsController {
	
	/// Singleton instance
	static let shared = UserDefaultsController()
	
	let defaults = UserDefaults.standard
	
	
	
	
	// MARK: - Phone Number
	
	public func save(phoneNumber: String) {
		defaults.set(phoneNumber, forKey: "phoneNumber")
	}
	
	public func loadPhoneNumber() -> String {
		return defaults.string(forKey: "phoneNumber")!
	}
	
}
