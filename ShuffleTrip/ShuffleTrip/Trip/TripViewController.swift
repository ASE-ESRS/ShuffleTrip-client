//
//  TripViewController.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {
	
	@IBOutlet weak var destinationLabel: UILabel!
	@IBOutlet weak var costSig: UILabel!
	@IBOutlet weak var costInsig: UILabel!

	var trip: Trip!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureInterface()
	}
	
	func configureInterface() {
		// Set the destination
		destinationLabel.text = trip.destination
		
		// Split the cost into significant and insignificant bits,.
		let costString = String(trip.cost)
		let pointIndex = costString.index(of: ".")!
		costSig.text = "£\(costString[..<pointIndex])"
		costInsig.text = "\(costString[pointIndex...])"
	}

}
