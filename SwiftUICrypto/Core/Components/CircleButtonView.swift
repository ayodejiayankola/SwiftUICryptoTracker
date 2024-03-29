//
//  CircleButtonView.swift
//  SwiftUICrypto
//
//  Created by Ayodeji Ayankola on 09/12/2023.
//

import SwiftUI

struct CircleButtonView: View {
	
	let iconName: String
    var body: some View {
        Image(systemName: iconName)
				.font(.headline)
				.foregroundStyle(Color.theme.accent)
				.frame(width: 50, height: 50)
				.background(
					Circle()
						.foregroundStyle(Color.theme.background)
				)
				.shadow(
					color: Color.theme.accent.opacity(0.25),
					radius: 10)
				.padding()
		}
		
}
#Preview(traits: .sizeThatFitsLayout) {
		CircleButtonView(iconName: "info")
			.preferredColorScheme(.light)
}
