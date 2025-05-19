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
			List {
				featuredSection
			}
			.navigationTitle("Explore")
		}
	}

	// MARK: - ExploreView UI Helpers
	private var featuredSection: some View {
		Section {
			carouselView
		} header: {
			AppTextView(
				text: "Featured Avatars",
				font: .headline,
				weight: .heavy,
				color: .secondary
			)
		}
	}

	private var carouselView: some View {
		ZStack {
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
		}
		.listRowFormatting()
		.scrollIndicators(.hidden)
	}
}

#Preview {
	ExploreView()
}
