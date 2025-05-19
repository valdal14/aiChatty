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
	@State private var popularAvatars: [AvatarModel] = AvatarModel.mocks

	var body: some View {
		NavigationStack {
			List {
				featuredSection
				categorySection
				popularSection
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
				text: "Featured",
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
						title: avatar.name ?? "",
						subTitle: avatar.characterDescription,
						imageURL: avatar.profileImageName,
						width: screenWidth
					)
					.anyButton(.plain, action: ({
						print("Tapped Carousel Cell")
					}))
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
			.anyButton(.plain, action: ({
				print("Tapped Category Cell")
			}))
		}
	}
}

// MARK: - ExploreView Popular Section
private extension ExploreView {
	var popularSection: some View {
		Section {
			ForEach(popularAvatars) { avatar in
				PopularCellView(
					title: avatar.name,
					subTitle: avatar.characterDescription,
					imageName: avatar.profileImageName
				)
				.anyButton(.highlight, action: ({
					print("Tapped Popular Cell")
				}))
				.listRowFormatting()
			}
		} header: {
			AppTextView(
				text: "Popular",
				font: .headline,
				weight: .heavy,
				color: .secondary
			)
		}
	}
}

// MARK: - ExploreView's Preview
#Preview {
	ExploreView()
}
