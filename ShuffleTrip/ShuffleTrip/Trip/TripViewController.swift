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

	var trip: Trip!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		destinationLabel.text = trip.destination
	}

}
