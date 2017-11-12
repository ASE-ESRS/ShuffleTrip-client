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
	
	func requestRandomTrip(completionHandler: @escaping (Trip) -> ()) {
		Alamofire.request("https://iagx7vnad8.execute-api.eu-west-2.amazonaws.com/prod/shuffleTrip?route=trips/shuffle", method: .get, encoding: JSONEncoding.default).responseJSON { response in
			if let status = response.response?.statusCode {
				switch status {
				case 201:
					print("[ServerBackendController]\t\(status): SUCCESS")
					if let result = response.result.value {
						let json = result as! Dictionary<String, Any>
						print(json)
						
						// Extract the latitude and longitude.
						let airportLocationString = json["airport_location"] as! String
						let commaIndex = airportLocationString.index(of: ",")!
						let longitude = "\(airportLocationString[commaIndex...])"
						let latitude = "\(airportLocationString[..<commaIndex])"
						
						let trip = Trip(countryName: 	json["country_name"] as! String,
										countryID: 		json["country"] as! String,
										airportName: 	json["country_name"] as! String,
										airportID: 		json["country_code"] as! String,
										airportCoordinates: (longitude, latitude),
										airportCity: 	json["country_city"] as! String,
										cost: 			json["price"] as! Double)
						completionHandler(trip)
					}
				default:
					print("[ServerBackendController]\t\(status): ERROR — \(response)")
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
