//
//  CoinImageService.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 02/02/2024.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
	
	@Published var image: UIImage? = nil
	
	private var imageSubscription: AnyCancellable?
	
	private let coin: CoinModel
	
	init(coin: CoinModel) {
		self.coin = coin
		getCoinImage()
	}
	
	private func getCoinImage(){
		guard let url = URL(string: coin.image) else { return }
		
		imageSubscription = NetworkingManager.download(url: url)
			.tryMap({ (data) -> UIImage? in
				return UIImage(data: data)
			})
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
				self?.image = returnedImage
				self?.imageSubscription?.cancel()
			})
	}
	
}

