//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 05/01/2024.
//

import Foundation

// ObservableObject  - so it can be observed from the view

class HomeViewModel: ObservableObject {
	
	@Published var allCoins: [CoinModel] = []
	@Published var portfolioCoins: [CoinModel] = []
	
	init() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
			
			self.allCoins.append(DeveloperPreview.instance.coin)
			self.portfolioCoins.append(DeveloperPreview.instance.coin)
		}
	}
}
