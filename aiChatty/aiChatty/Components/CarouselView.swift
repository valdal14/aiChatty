//
//  CarouselView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 18/5/25.
//

import SwiftUI

struct CarouselView: View {
	let screenWidth: CGFloat = UIScreen.main.bounds.width
	let items: [AvatarModel]
	@State private var avatarSelection: AvatarModel?

	private struct Constants {
		static let vStackSpacing: CGFloat = 12
		static let carouselItemHeight: CGFloat = 200
		static let hStackSpacing: CGFloat = 0
		static let circleSpacing: CGFloat = 8
		static let circleOpacity: Double = 0.5
		static let circleWidth: CGFloat = 10
	}

    var body: some View {
		VStack(spacing: Constants.vStackSpacing) {
			scrollView
			circleIndicators
		}
    }

	// MARK: - View Helpers
	var scrollView: some View {
		ScrollView(.horizontal) {
			lazyContainerView
		}
		.frame(height: Constants.carouselItemHeight)
		.scrollIndicators(.hidden)
		.scrollTargetLayout()
		.scrollTargetBehavior(.paging)
		.scrollPosition(id: $avatarSelection)
		.onChange(of: items.count, { _, _ in
			setCircleIndicator()
		})
		.onAppear {
			setCircleIndicator()
		}
	}

	var lazyContainerView: some View {
		LazyHStack(spacing: Constants.hStackSpacing) {
			itemView
		}
	}

	var itemView: some View {
		ForEach(items) { item in
			HeroCellView(
				title: item.name,
				subTitle: item.characterDescription,
				imageURL: item.profileImageName,
				width: screenWidth
			)
			.scrollTransition(.interactive.threshold(.visible(0.95)), axis: .horizontal, transition: { content, phase in
				content
					.scaleEffect(phase.isIdentity ? 1 : 0.9)
			})
			.containerRelativeFrame(.horizontal, alignment: .center)
			.id(item)
		}
	}

	var circleIndicators: some View {
		HStack(spacing: Constants.circleSpacing) {
			ForEach(items) { item in
				Circle()
					.fill(item == avatarSelection ? .accent : .secondary.opacity(Constants.circleOpacity))
					.frame(width: Constants.circleWidth)
			}
		}
		.animation(.linear, value: avatarSelection)
	}
}

// MARK: - CarouselView Extension
private extension CarouselView {
	func setCircleIndicator() {
		if avatarSelection == nil || avatarSelection == items.last {
			avatarSelection = items.first
		}
	}
}

#Preview {
	CarouselView(items: AvatarModel.mocks)
}
