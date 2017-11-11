//
//  WelcomeViewController.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

	@IBOutlet weak var phoneNumberField: UITextField!
	
	// Make the status bar have light content to contrast with the dark background.
	override var preferredStatusBarStyle: UIStatusBarStyle { get { return .lightContent } }
	
	
	
	
	// MARK: -
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		phoneNumberField.becomeFirstResponder()
	}
	
	@IBAction func continueButtonPressed() {
		print("Phone Number: +44 \(phoneNumberField.text!)")
	}

}
