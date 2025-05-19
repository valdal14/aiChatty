//
//  CategoryCellView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 19/5/25.
//

import SwiftUI

struct CategoryCellView: View {
	let title: String
	let imageName: String
	let font: Font
	let cornerRadius: CGFloat
	let size: CGFloat

	private struct Constants {
		static let padding: CGFloat = 16
	}

	init(
		title: String,
		imageName: String,
		font: Font = .title2,
		cornerRadius: CGFloat = 16,
		size: CGFloat = 150
	) {
		self.title = title
		self.imageName = imageName
		self.font = font
		self.cornerRadius = cornerRadius
		self.size = size
	}

    var body: some View {
		ImageLoaderView(imageURL: imageName, resizeMode: .fill)
			.clipShape(RoundedRectangle(cornerRadius: cornerRadius))
			.aspectRatio(1, contentMode: .fit)
			.frame(width: size, height: size)
			.overlay(alignment: .bottomLeading) {
				overlayContent
			}
    }

	// MARK: - View Helpers
	private var overlayContent: some View {
		AppTextView(
			text: title,
			font: font,
			weight: .semibold,
			color: .white
		)
		.padding(Constants.padding)
		.frame(maxWidth: .infinity, alignment: .leading)
		.cellBackground()
	}
}

#Preview {
	VStack {
		CategoryCellView(
			title: "Avatar",
			imageName: GlobalConstants.randomImageURL
		)
		
		CategoryCellView(
			title: "Avatar",
			imageName: GlobalConstants.randomImageURL,
			size: 300
		)
	}
}
