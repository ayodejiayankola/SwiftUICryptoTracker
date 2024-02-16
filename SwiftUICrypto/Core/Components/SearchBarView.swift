//
//  SearchBarView.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 16/02/2024.
//

import SwiftUI

struct SearchBarView: View {
	@Binding var searchText: String
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.foregroundColor(
					searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
				)
			
			TextField("Search by name or symbol...", text: $searchText)
				.foregroundColor(Color.theme.accent)
				.autocorrectionDisabled()
				.overlay (
					Image(systemName: "xmark.circle.fill")
						.padding()
						.offset(x: 10)
						.foregroundColor(Color.theme.accent)
						.opacity(searchText.isEmpty ? 0.0 : 1)
						.onTapGesture {
							UIApplication.shared.endEditing()
							searchText = ""
						}
					, alignment: .trailing
				)
		}
		.font(.headline)
		.padding()
		.background(
			RoundedRectangle(cornerRadius: 25)
				.fill(Color.theme.background)
				.shadow(
					color: Color.theme.accent.opacity(0.15), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
					x: 0,
					y: 0)
		)
		.padding()
	}
}

#Preview {
	SearchBarView(searchText: .constant(""))
}
