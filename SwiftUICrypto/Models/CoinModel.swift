//
//  CoinModel.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 18/12/2023.
//

import Foundation

// CoinGecko API Info

/*
 URL:
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en
 
 JSON Response:
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
 "current_price": 41364,
 "market_cap": 810226489082,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 869265112835,
 "total_volume": 20784681730,
 "high_24h": 42319,
 "low_24h": 40571,
 "price_change_24h": -588.5020087220619,
 "price_change_percentage_24h": -1.40277,
 "market_cap_change_24h": -9545920632.775757,
 "market_cap_change_percentage_24h": -1.16446,
 "circulating_supply": 19573725,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 69045,
 "ath_change_percentage": -40.12307,
 "ath_date": "2021-11-10T14:24:11.849Z",
 "atl": 67.81,
 "atl_change_percentage": 60868.14461,
 "atl_date": "2013-07-06T00:00:00.000Z",
 "roi": null,
 "last_updated": "2023-12-18T16:37:47.553Z",
 "sparkline_in_7d": {
 "price": [
 42345.67055988128,
 42211.75130516923,
 42070.62720658794,
 41898.11604074295
 ]
 },
 "price_change_percentage_24h_in_currency": -1.4027730755037513
 }
 
 */
struct CoinModel: Identifiable, Codable {
	let id, symbol, name: String
	let image: String
	let currentPrice: Double
	let marketCap, marketCapRank, fullyDilutedValuation: Double?
	let totalVolume, high24H, low24H: Double?
	let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
	let circulatingSupply, totalSupply, maxSupply, ath: Double?
	let athChangePercentage: Double?
	let athDate: String?
	let atl, atlChangePercentage: Double?
	let atlDate: String?
	let lastUpdated: String?
	let sparklineIn7D: SparklineIn7D
	let priceChangePercentage24HInCurrency: Double?
	let currentHoldings: Double?
	
	enum CodingKeys: String, CodingKey {
		case id, symbol, name, image
		case currentPrice = "current_price"
		case marketCap = "market_cap"
		case marketCapRank = "market_cap_rank"
		case fullyDilutedValuation = "fully_diluted_valuation"
		case totalVolume = "total_volume"
		case high24H = "high_24h"
		case low24H = "low_24h"
		case priceChange24H = "price_change_24h"
		case priceChangePercentage24H = "price_change_percentage_24h"
		case marketCapChange24H = "market_cap_change_24h"
		case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
		case circulatingSupply = "circulating_supply"
		case totalSupply = "total_supply"
		case maxSupply = "max_supply"
		case ath
		case athChangePercentage = "ath_change_percentage"
		case athDate = "ath_date"
		case atl
		case atlChangePercentage = "atl_change_percentage"
		case atlDate = "atl_date"
		case lastUpdated = "last_updated"
		case sparklineIn7D = "sparkline_in_7d"
		case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
		case currentHoldings
	}
	
	func updateHoldings(amount: Double) -> CoinModel {
		return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: athChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
	}
	
	var currentValueHoldings: Double {
		return (currentHoldings ?? 0) * currentPrice
	}
	
	var rank: Int {
		return Int(marketCapRank ?? 0)
	}
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
	let price: [Double]?
}
