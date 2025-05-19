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
	@State private var avatars: [AvatarModel] = AvatarModel.mocks
	@State private var categories: [CharacterOption] = CharacterOption.allCases

	var body: some View {
		NavigationStack {
			List {
				featuredSection
				categorySection
			}
			.navigationTitle("Explore")
		}
	}
}

// MARK: - ExploreView Featured Avatars Section
private extension ExploreView {
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

// MARK: - ExploreView Categories Section
private extension ExploreView {
	var categorySection: some View {
		Section {
			zStackContainer
		} header: {
			AppTextView(
				text: "Categories",
				font: .headline,
				weight: .heavy,
				color: .secondary
			)
		}
	}

	var zStackContainer: some View {
		ZStack {
			scrollView
		}
		.listRowFormatting()
	}

	var scrollView: some View {
		ScrollView(.horizontal) {
			hStack
		}
		.scrollIndicators(.hidden)
		.scrollTargetLayout()
		.scrollTargetBehavior(.viewAligned)
	}

	var hStack: some View {
		HStack {
			categoryCellView
		}
	}

	var categoryCellView: some View {
		ForEach(categories, id: \.rawValue) { option in
			CategoryCellView(
				title: option.rawValue.capitalized,
				imageName: GlobalConstants.randomImageURL
			)
		}
	}
}

#Preview {
	ExploreView()
}
