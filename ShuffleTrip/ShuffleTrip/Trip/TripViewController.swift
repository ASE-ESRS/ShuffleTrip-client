//
//  TripViewController.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import UIKit
import MapKit

class TripViewController: UIViewController {
	
	@IBOutlet weak var destinationLabel: UILabel!
	@IBOutlet weak var flagLabel: UILabel!
	
	@IBOutlet weak var mapView: MKMapView!
	
	@IBOutlet weak var costSig: UILabel!
	@IBOutlet weak var costInsig: UILabel!

	var trip: Trip!
	
	
	
	
	// MARK: - Initialisation
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureInterface()
	}
	
	func configureInterface() {
		// Set the destination
		destinationLabel.text = trip.countryName.uppercased()
		flagLabel.text = trip.countryFlag
		
		configureAndRepositionMap()
		
		// Split the cost into significant and insignificant bits,.
		let costString = String(trip.cost)
		let pointIndex = costString.index(of: ".")!
		costSig.text = "\(costString[..<pointIndex])"
		
		// Prepend '0' if needed.
		let penniesIndex = costString.index(after: pointIndex)
		let pennies = costString[penniesIndex...]
		if pennies.count == 1 {
			costInsig.text = ". 0\(pennies)"
		} else {
			costInsig.text = ". \(pennies)"
		}
	}
	
	func configureAndRepositionMap() {
		mapView.delegate = self
		
		// Reposition the map view.
		let location = CLLocationCoordinate2D(latitude: trip.latLong.0, longitude: trip.latLong.1)
		mapView.setRegion(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8)), animated: false)
		
		// Place the annotation
		let airportAnnotation = MKPointAnnotation()
		airportAnnotation.coordinate = location
		mapView.addAnnotation(airportAnnotation)
	}
	
	
	
	
	// MARK: -
	
	@IBAction func bookTripButtonPressed() {
		LocalTemporaryStorageController.shared.trips.append(trip)
		dismissButtonPressed()
	}
	
	@IBAction func dismissButtonPressed() {
		dismiss(animated: true, completion: nil)
	}

}

extension TripViewController: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
		// Select the annotation as soon as it's added.
		if let annotationView = views.first as? MKMarkerAnnotationView {
			annotationView.glyphText = trip.countryFlag
			mapView.selectAnnotation(annotationView.annotation!, animated: true)
		}
	}
	
}
