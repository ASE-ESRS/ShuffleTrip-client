//
//  ServerBackendController.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import Foundation
import Alamofire

public class ServerBackendController {
	
	/// Singleton instance
	static let shared = ServerBackendController()
	
	lazy var phoneNumber: String = {
		return UserDefaultsController.shared.loadPhoneNumber()
	}()
	
	
	
	
	func requestRandomTrip(completionHandler: (Trip) -> Void) {
		let parameters: Parameters = ["phoneNumber" : phoneNumber]
		Alamofire.request("https://httpbin.org/get", method: .post, parameters: parameters).response { response in
			print(response)
		}
	}
	
	func savePhoneNumber() {
		let parameters: Parameters = ["phoneNumber" : phoneNumber]
		Alamofire.request("https://httpbin.org/get", method: .post, parameters: parameters).response { response in
			print(response)
		}
	}

}
