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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if UserDefaultsController.shared.loadPhoneNumber().count < 1 {
			performSegue(withIdentifier: "ToPhoneNumberComplete", sender: self)
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		phoneNumberField.becomeFirstResponder()
	}
	
	@IBAction func continueButtonPressed() {
		let phoneNumber = "+44\(phoneNumberField.text!)".replacingOccurrences(of: " ", with: "")
		savePhoneNumberLocally(phoneNumber)
		savePhoneNumberToServer(phoneNumber)
		performSegue(withIdentifier: "ToPhoneNumberComplete", sender: self)
	}
	
	func savePhoneNumberLocally(_ phoneNumber: String) {
		UserDefaultsController.shared.save(phoneNumber: phoneNumber)
	}
	
	func savePhoneNumberToServer(_ phoneNumber: String) {
		ServerBackendController.shared.savePhoneNumber()
	}

}
