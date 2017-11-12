//
//  SecondViewController.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	override var preferredStatusBarStyle: UIStatusBarStyle { get { return .lightContent }}
	
	@IBOutlet weak var tableView: UITableView!
	
	lazy var trips = {
		return LocalTemporaryStorageController.shared.trips
	}()
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		trips = LocalTemporaryStorageController.shared.trips
		tableView.reloadSections([0], with: .automatic)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return trips.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripTableViewCell
		
		cell.trip = trips[indexPath.row]
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let tripViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TripViewController") as! TripViewController
		tripViewController.trip = trips[indexPath.row]
		present(tripViewController, animated: true, completion: nil)
	}
	
}
