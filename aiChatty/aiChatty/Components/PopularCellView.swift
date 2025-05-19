//
//  PopularCellView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 19/5/25.
//

import SwiftUI

struct PopularCellView: View {
	let title: String?
	let subTitle: String?
	let imageName: String?
	let radius: CGFloat
	let frameSize: CGFloat

	private struct Constants {
		static let spacing: CGFloat = 4
		static let cellPadding: CGFloat = 12
		static let cellVerticalPadding: CGFloat = 4
	}

	init(
		title: String?,
		subTitle: String?,
		imageName: String?,
		radius: CGFloat = 16,
		frameSize: CGFloat = 60
	) {
		self.title = title
		self.subTitle = subTitle
		self.imageName = imageName
		self.radius = radius
		self.frameSize = frameSize
	}

    var body: some View {
		HStack {
			renderImage()
			VStack(alignment: .leading, spacing: Constants.spacing) {
				renderText()
			}
			.frame(maxWidth: .infinity, alignment: .leading)
		}
		.padding(Constants.cellPadding)
		.padding(Constants.cellVerticalPadding)
		.background(Color.init(uiColor: .systemBackground))
    }
}

// MARK: - PopularCellView View' helpers
private extension PopularCellView {
	@ViewBuilder func renderImage() -> some View {
		ZStack {
			if let imageName {
				ImageLoaderView(imageURL: imageName, resizeMode: .fill)
					.profileCellShape(frameSize: frameSize, radius: radius)
			} else {
				RoundedRectangle(cornerRadius: radius)
					.fill(.secondary.opacity(0.5))
					.profileCellShape(frameSize: frameSize, radius: radius)
			}
		}
	}
	@ViewBuilder func renderText() -> some View {
		if let title {
			AppTextView(
				text: title,
				font: .headline
			)
		}
		if let subTitle {
			AppTextView(
				text: subTitle,
				font: .subheadline
			)
		}
	}
}

#Preview {
	ZStack {
		Color.gray.ignoresSafeArea()
		List {
			PopularCellView(
				title: "Alpha",
				subTitle: "An Alien that is smiling in the park",
				imageName: GlobalConstants.randomImageURL,
				radius: 16,
				frameSize: 100
			)
			PopularCellView(
				title: "Alpha",
				subTitle: "An Alien that is smiling in the park",
				imageName: nil,
				radius: 16,
				frameSize: 100
			)
			PopularCellView(
				title: nil,
				subTitle: "An Alien that is smiling in the park",
				imageName: GlobalConstants.randomImageURL,
				radius: 16,
				frameSize: 100
			)
			PopularCellView(
				title: "Alpha",
				subTitle: nil,
				imageName: nil,
				radius: 16,
				frameSize: 100
			)
		}
	}
}
