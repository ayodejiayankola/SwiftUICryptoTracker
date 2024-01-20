//
//  CoinDataService.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 12/01/2024.
//

import Foundation
import Combine

class CoinDataService {
	
	// AllCoins become a Publishers which can have subscribers
	@Published var allCoins: [CoinModel] = []
	
//	var cancellables = Set<AnyCancellable>()
	
	var coinSubscription: AnyCancellable?
	
	init() {
		getCoins()
	}
	
	private func getCoins() {
		guard let url = URL(string:
													"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else { return }
		coinSubscription =	NetworkingManager.download(url: url)
			.decode(type: [CoinModel].self, decoder: JSONDecoder())
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
				self?.allCoins = returnedCoins
				self?.coinSubscription?.cancel()
			}
//			.store(in: &cancellables)

			)

	}
}
