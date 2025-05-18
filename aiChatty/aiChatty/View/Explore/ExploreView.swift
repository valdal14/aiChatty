//
//  ExploreView.swift
//  aiChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import UIKit
import SwiftUI

struct ExploreView: View {
	let screenWidth: CGFloat = UIScreen.main.bounds.width - 50
	let avatars: [AvatarModel] = AvatarModel.mocks
	var body: some View {
		NavigationStack {
			ScrollView(.vertical) {
				carouselHeader
				carouselView
			}
		}
	}

	// MARK: - ExploreView UI Helpers
	var carouselHeader: some View {
		HStack {
			AppTextView(
				text: "FEATURED AVATARS",
				font: .headline,
				weight: .heavy,
				color: .secondary
			)
			Image(systemName: "tortoise.fill")
				.aspectRatio(contentMode: .fit)
				.foregroundStyle(.secondary)
				.font(.headline)
			Spacer()
		}
		.padding()
	}
	var carouselView: some View {
		CarouselView(
			items: avatars,
			content: ({ avatar in
				HeroCellView(
					title: avatar.name,
					subTitle: avatar.characterDescription,
					imageURL: avatar.profileImageName,
					width: screenWidth
				)
			})
		)
		.navigationTitle("Explore")
		.scrollIndicators(.hidden)
	}
}

#Preview {
	ExploreView()
}
