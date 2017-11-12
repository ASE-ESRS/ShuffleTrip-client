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
	
	
	
	
	// MARK: -
	
	func requestRandomTrip(completionHandler: @escaping (Trip?) -> ()) {
		Alamofire.request("https://iagx7vnad8.execute-api.eu-west-2.amazonaws.com/prod/shuffleTrip?route=trips/shuffle", method: .get, encoding: JSONEncoding.default).responseJSON { response in
			if let status = response.response?.statusCode {
				switch status {
				case 200:
					if let result = response.result.value {
						let json = result as! Dictionary<String, Any>
						let tripJSON = json["trip"]! as! Dictionary<String, Any>
						
						let trip = Trip(countryName: 	tripJSON["country_name"] as! String,
										countryID: 		tripJSON["country_id"] as! String,
										cost: 			tripJSON["cost"] as! Double)
						completionHandler(trip)
					}
				default:
					print("[ServerBackendController]\t\(status): ERROR — \(response)")
					completionHandler(nil)
				}
			}
		}
	}
	
	func savePhoneNumber() {
		let parameters: Parameters = ["userId" : phoneNumber]
		Alamofire.request("https://4wmuzhlr5b.execute-api.eu-west-2.amazonaws.com/prod/StorePhoneNumber", method: .post, parameters: parameters, encoding: URLEncoding.queryString).response { response in
			print("[ServerBackendController]\tPhone number POST request sent")
		}
	}

}
