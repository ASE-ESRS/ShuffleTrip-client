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
//		destinationLabel.text = trip.destination
		
		configureAndRepositionMap()
		
		// Split the cost into significant and insignificant bits,.
		let costString = String(trip.cost)
		let pointIndex = costString.index(of: ".")!
		costSig.text = "\(costString[..<pointIndex])"
		costInsig.text = "\(costString[pointIndex...])"
	}
	
	func configureAndRepositionMap() {
		mapView.delegate = self
		
		// Reposition the map view.
//		let location = CLLocationCoordinate2D(latitude: trip.latitude, longitude: trip.longitude)
//		mapView.setRegion(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 8, longitudeDelta: 8)), animated: false)
		
		// Place the annotation
//		let airportAnnotation = MKPointAnnotation()
//		airportAnnotation.coordinate = location
//		mapView.addAnnotation(airportAnnotation)
	}

}

extension TripViewController: MKMapViewDelegate {
	
	func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
		// Select the annotation as soon as it's added.
		if let annotationView = views.first as? MKMarkerAnnotationView {
			annotationView.glyphText = "CBA"
			mapView.selectAnnotation(annotationView.annotation!, animated: true)
		}
	}
	
}
