//
//  HomeViewModel.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 05/01/2024.
//

import Foundation
import Combine

// ObservableObject  - so it can be observed from the view

class HomeViewModel: ObservableObject {
	
	@Published var allCoins: [CoinModel] = []
	@Published var portfolioCoins: [CoinModel] = []
	
	@Published var searchText: String = ""
	
	private let dataService = CoinDataService()
	
	private var cancellables = Set<AnyCancellable>()
	
	init() {
		//		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
		//
		//			self.allCoins.append(DeveloperPreview.instance.coin)
		//			self.portfolioCoins.append(DeveloperPreview.instance.coin)
		//		}
		addSubscribers()
	}
	
	func addSubscribers() {
		//		self.dataService.$allCoins
		//			.sink { [weak self](returnedCoins) in
		//				self?.allCoins = returnedCoins
		//			}
		//			.store(in: &cancellables)
		//
		//updates all coins
		$searchText
			.combineLatest(dataService.$allCoins)
			.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
			.map(filterCoins)
			.sink { [weak self] (returnedCoins) in
				self?.allCoins = returnedCoins
			}
			.store(in: &cancellables)
		
	}
	
	private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
		guard !text.isEmpty else { return coins}
		
		let lowercasedText = text.lowercased()
		
		return coins.filter { (coin) -> Bool in
			return coin.name.lowercased().contains(lowercasedText) ||
			coin.symbol.lowercased().contains(lowercasedText) ||
			coin.id.lowercased().contains(lowercasedText)
		}
		
	}
}
