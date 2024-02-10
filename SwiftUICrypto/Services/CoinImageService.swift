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
	
	private let fileManger = LocalFileManager.instance
	
	private let folderName = "coin_images"
	
	private let imageName: String
	
	init(coin: CoinModel) {
		self.coin = coin
		self.imageName = coin.id
		getCoinImage()
	}
	
	private func getCoinImage() {
		if let savedImage = fileManger.getImage(imageName: imageName, folderName: folderName) {
			image = savedImage
		} else {
			downloadCoinImage()
		}
	}
	
	private func downloadCoinImage(){
		guard let url = URL(string: coin.image) else { return }
		
		imageSubscription = NetworkingManager.download(url: url)
			.tryMap({ (data) -> UIImage? in
				return UIImage(data: data)
			})
			.sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
				guard let self = self, let downloadedImage = returnedImage else { return }
				self.image = returnedImage
				self.imageSubscription?.cancel()
				fileManger.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
			})
	}
	
}

