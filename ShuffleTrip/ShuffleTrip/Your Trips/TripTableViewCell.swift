//
//  TripTableViewCell.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 12/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
	
	@IBOutlet weak var countryNameLabel: UILabel!
	@IBOutlet weak var countryFlagLabel: UILabel!

	var trip: Trip! {
		didSet {
			countryNameLabel.text = trip.countryName.uppercased()
			countryFlagLabel.text = trip.countryFlag
		}
	}
	
}
