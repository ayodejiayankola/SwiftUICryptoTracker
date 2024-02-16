//
//  UIApplication.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 16/02/2024.
//

import Foundation
import SwiftUI

extension UIApplication {
	func endEditing() {
		sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}
