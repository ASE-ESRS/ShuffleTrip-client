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
	
	
	
	
	func requestRandomTrip(completionHandler: @escaping (Trip) -> ()) {
		let parameters: Parameters = ["userId" : phoneNumber]
		Alamofire.request("https://iagx7vnad8.execute-api.eu-west-2.amazonaws.com/prod/shuffleTrip?route=trips/shuffle", method: .post, parameters: parameters, encoding: URLEncoding.queryString).responseJSON { jsonResponse in
////			print(jsonResponse.result.value)
//			let trip = Trip(destination: "BARCELONA", cost: 129.55, latitude: 41.390205, longitude: 2.154007)
//			completionHandler(trip)
		}
	}
	
	func savePhoneNumber() {
		let parameters: Parameters = ["userId" : phoneNumber]
		Alamofire.request("https://4wmuzhlr5b.execute-api.eu-west-2.amazonaws.com/prod/StorePhoneNumber", method: .post, parameters: parameters, encoding: URLEncoding.queryString).response { response in
			print("Request POSTed")
		}
	}

}
