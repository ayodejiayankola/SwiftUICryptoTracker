//
//  HomeView.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 09/12/2023.
//

import SwiftUI

struct HomeView: View {
	
	@EnvironmentObject private var vm: HomeViewModel
	@State private var showPortfolio: Bool = false
	
	var body: some View {
		ZStack(content: {
			Color.theme.background
				.ignoresSafeArea()
			
			VStack{
				homeHeader
				SearchBarView(searchText: $vm.searchText)
				columnTitles
				
				if !showPortfolio {
					allCoinsList
						.transition(.move(edge: .leading))
				}
				
				if showPortfolio {
					portfolioCoinsList.transition(.move(edge: .trailing))
				}
				
				Spacer(minLength: 0)
			}
		}).onAppear(perform: {
			showPortfolio = true
		})
	}
    
}

#Preview {
	NavigationView{
		HomeView()
			.navigationBarHidden(true)
	}.environmentObject(Preview.dev.homeVM)
}

extension HomeView {
	
	private var homeHeader: some View {
		HStack {
			CircleButtonView(iconName: showPortfolio ? "plus" : "info")
				.animation(.none, value: showPortfolio)
				.background(
					CircleButtonAnimationView(animate: $showPortfolio)
				)
				
			Spacer()
			Text(showPortfolio ? "Portfolio" : "Live Prices")
				.font(.headline)
				.fontWeight(.heavy)
				.foregroundStyle(Color.theme.accent)
				.animation(.none, value: showPortfolio)
			
			
			
			Spacer()
			CircleButtonView(iconName: "chevron.right")
				.rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
				.onTapGesture {
					withAnimation(.spring()) {
						showPortfolio.toggle()
					}
				}
		}
		.padding(.horizontal)
		
	}
	
	
	private var allCoinsList: some View {
		List {
			ForEach(vm.allCoins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: false)
					.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
			}
		}.listStyle(PlainListStyle())
	}
	
	private var portfolioCoinsList: some View {
		List {
			ForEach(vm.portfolioCoins) { coin in
				CoinRowView(coin: coin, showHoldingsColumn: true)
					.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
			}
		}.listStyle(PlainListStyle())
	}
	
	private var columnTitles: some View {
		HStack {
			Text("Coin")
			Spacer()
			if showPortfolio {
				Text("Holding")
			}
			Text("Price")
								.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
						}
						.font(.caption)
						.foregroundStyle(Color.theme.secondaryText)
						.padding(.horizontal)
						
	}
}
