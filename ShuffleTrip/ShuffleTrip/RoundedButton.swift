//
//  RoundedButton.swift
//  ShuffleTrip
//
//  Created by Loic Verrall on 11/11/2017.
//  Copyright © 2017 ASE-ESRS. All rights reserved.
//

import UIKit
import QuartzCore

/// A nicely rounded-corners button.
@IBDesignable class RoundedButton: UIButton {
	
	/// Used to dim the button when it is pressed.
	override var isHighlighted: Bool {
		didSet {
			UIView.animate(withDuration: 0.2) {
				self.alpha = self.isHighlighted ? 0.5 : 1.0
			}
		}
	}
	
	override var isEnabled: Bool {
		didSet {
			UIView.animate(withDuration: 0.2) {
				self.backgroundColor = self.isHighlighted ? UIColor.lightGray : self.backgroundColor
			}
		}
	}
	
	/// The corner radius of this rounded button.
	@IBInspectable internal var cornerRadius: CGFloat = 4 {
		didSet {
			layer.cornerRadius = cornerRadius
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		clipsToBounds = true
		layer.cornerRadius = cornerRadius
		layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
		layer.borderWidth = 2
	}
}
