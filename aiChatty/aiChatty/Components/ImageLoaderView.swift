//
//  ImageLoaderView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

struct ImageLoaderView: View {
	var imageURL: String = GlobalConstants.randomImageURL
	var resizeMode: ContentMode = .fill

    var body: some View {
		imageContainer
    }

	var accessibilityName: String {
		"\(imageURL) image"
	}

	var imageContainer: some View {
		Rectangle()
			.opacity(0.001)
			.overlay { asyncImageView }
			.clipped()
	}

	var asyncImageView: some View {
		AsyncImage(
			url: URL(string: imageURL),
			content: ({ img in
				img
					.resizable()
					.aspectRatio(contentMode: resizeMode)
					.allowsHitTesting(false)
					.accessibilityIdentifier(accessibilityName)
			}),
			placeholder: ({
				ImageLoadingAnimationView()
			})
		)
	}
}

// MARK: - ImageLoaderView Redacted Loading Animation

struct ImageLoadingAnimationView: View {
	struct Constants {
		static let rectSize: CGFloat = 600
	}

	var body: some View {
		imagePlaceholder
			.redacted(reason: .placeholder)
			.loadingAnimation()
	}

	var imagePlaceholder: some View {
		Rectangle()
			.frame(
				maxWidth: .infinity,
				minHeight: Constants.rectSize,
				maxHeight: Constants.rectSize
			)
			.foregroundStyle(.gray.opacity(0.5))
			.ignoresSafeArea(.all)
	}
}

#Preview {
    ImageLoaderView()
}

#Preview("Loading Animation") {
	ImageLoadingAnimationView()
}
