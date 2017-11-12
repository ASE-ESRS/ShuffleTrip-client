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
	
	
	
	
	// MARK: -
	
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

	@IBAction func requestTripButtonPressed() {
		UIView.animate(withDuration: 0.3) {
			self.requestTripButton.isEnabled = false
			self.requestTripButton.setTitle("Requesting...", for: .normal)
		}
		
		ServerBackendController.shared.requestRandomTrip { (trip) in
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let tripViewController = storyboard.instantiateViewController(withIdentifier: "TripViewController") as! TripViewController
			tripViewController.trip = trip
			self.present(tripViewController, animated: true, completion: nil)
		}
	}

}
