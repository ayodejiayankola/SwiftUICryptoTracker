//
//  SwiftUICryptoApp.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 05/12/2023.
//

import SwiftUI

@main
struct SwiftUICryptoApp: App {

	@StateObject private var vm = HomeViewModel()
	
	var body: some Scene {
		WindowGroup {
			NavigationView {
				HomeView()
					.navigationBarHidden(true)
			}.environmentObject(vm)
		}
	}
}

