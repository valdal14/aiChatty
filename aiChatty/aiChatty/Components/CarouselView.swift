//
//  CarouselView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 18/5/25.
//

import SwiftUI

struct CarouselView<Content: View, K: Collectionable>: View {
	// MARK: UI Constants
	let vStackSpacing: CGFloat = 12
	let carouselItemHeight: CGFloat = 200
	let hStackSpacing: CGFloat = 0
	let circleSpacing: CGFloat = 8
	let circleOpacity: Double = 0.5
	let circleWidth: CGFloat = 10
	// MARK: - Properties
	let screenWidth: CGFloat = UIScreen.main.bounds.width
	let items: [K]
	@State private var selection: K?
	@ViewBuilder var content: (K) -> Content
	// MARK: - View's Body
    var body: some View {
		VStack(spacing: vStackSpacing) {
			scrollView
			circleIndicators
		}
    }
	// MARK: - View Helpers
	var scrollView: some View {
		ScrollView(.horizontal) {
			lazyContainerView
		}
		.frame(height: carouselItemHeight)
		.scrollIndicators(.hidden)
		.scrollTargetLayout()
		.scrollTargetBehavior(.paging)
		.scrollPosition(id: $selection)
		.onChange(of: items.count, { _, _ in
			setCircleIndicator()
		})
		.onAppear {
			setCircleIndicator()
		}
	}

	var lazyContainerView: some View {
		LazyHStack(spacing: hStackSpacing) {
			itemView
		}
	}

	var itemView: some View {
		ForEach(items) { item in
			renderContent(item)
		}
	}

	var circleIndicators: some View {
		HStack(spacing: circleSpacing) {
			circleView
		}
		.animation(.linear, value: selection)
	}

	var circleView: some View {
		ForEach(items) { item in
			renderDotIndicator(item)
		}
	}
}

// MARK: - CarouselView Extension
private extension CarouselView {
	func setCircleIndicator() {
		if selection == nil || selection == items.last {
			selection = items.first
		}
	}

	@ViewBuilder
	func renderDotIndicator(_ item: K) -> some View {
		Circle()
			.fill(item == selection ? .accent : .secondary.opacity(circleOpacity))
			.frame(width: circleWidth)
	}

	@ViewBuilder
	func renderContent(_ item: K) -> some View {
		content(item)
			.scrollTransition(
				.interactive.threshold(.visible(0.95)),
				axis: .horizontal,
				transition: ({ content, phase in
					content
						.scaleEffect(phase.isIdentity ? 1 : 0.9)
				})
			)
			.containerRelativeFrame(.horizontal, alignment: .center)
			.id(item)
	}
}

// MARK: - CarouselView's Preview
#Preview {
	CarouselView<HeroCellView, AvatarModel>(
		items: AvatarModel.mocks,
		content: ({ item in
			HeroCellView(
				title: item.name,
				subTitle: item.characterDescription,
				imageURL: item.profileImageName,
				width: UIScreen.main.bounds.width
			)
		})
	)
}
