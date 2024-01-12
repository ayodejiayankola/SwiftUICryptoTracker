//
//  ContentView.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 05/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
			ZStack {
				Color.theme.background
					.ignoresSafeArea()
				
				VStack(spacing: 70, content: {
					Text("Accent Color")
						.foregroundStyle(Color.theme.accent)
					Text("Red Color")
						.foregroundStyle(Color.theme.red)
					Text("Green Color")
						.foregroundStyle(Color.theme.green)
					Text("Secondary Text Color")
						.foregroundStyle(Color.theme.secondaryText)
				})
			}
		}
}

#Preview {
    ContentView()
}
