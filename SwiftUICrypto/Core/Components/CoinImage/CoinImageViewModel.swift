//
//  CoinImageViewModel.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 02/02/2024.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
	@Published var image: UIImage? = nil
	@Published var isLoading: Bool = true
	
	private let coin: CoinModel
	private let dataService: CoinImageService
	
	private var cancellables = Set<AnyCancellable>()
	
	init(coin: CoinModel) {
		self.coin = coin
		self.dataService = CoinImageService(coin: coin)
		addSubscribers()
	}
	private func addSubscribers() {
		self.dataService.$image
			.sink { [weak self] (_) in
				self?.isLoading = false
			} receiveValue: { [weak self] (returnedImage) in
				self?.image = returnedImage
			}
			.store(in: &cancellables)
		
	}
	
}
