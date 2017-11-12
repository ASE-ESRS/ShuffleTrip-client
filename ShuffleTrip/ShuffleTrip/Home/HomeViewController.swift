//
//  FirstViewController.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	
	@IBOutlet weak var requestTripButton: UIButton!
	
	override var preferredStatusBarStyle: UIStatusBarStyle { get { return .lightContent } }
	
	
	
	
	// MARK: - Initialisation
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		UITabBar.appearance().tintColor = #colorLiteral(red: 0, green: 0.7699727274, blue: 0.879308364, alpha: 1)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		if UserDefaultsController.shared.loadPhoneNumber().count < 1 {
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let welcomeVC = storyboard.instantiateViewController(withIdentifier: "Welcome")
			welcomeVC.modalPresentationStyle = .overFullScreen
			modalPresentationStyle = .overCurrentContext
			self.present(welcomeVC, animated: true, completion: nil)
		}
	}
	
	
	
	
	// MARK: -

	@IBAction func requestTripButtonPressed() {
		requestTripButton.isEnabled = false
		requestTripButton.setTitle("Requesting...", for: .normal)
		
		ServerBackendController.shared.requestRandomTrip { (trip) in
			guard let trip = trip else {
				self.requestTripButton.isEnabled = true
				self.requestTripButton.setTitle("Request Random Trip", for: .normal)
				return
			}
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let tripViewController = storyboard.instantiateViewController(withIdentifier: "TripViewController") as! TripViewController
			tripViewController.trip = trip
			self.present(tripViewController, animated: true, completion: {
				self.requestTripButton.isEnabled = true
				self.requestTripButton.setTitle("Request Random Trip", for: .normal)
			})
		}
	}

}
