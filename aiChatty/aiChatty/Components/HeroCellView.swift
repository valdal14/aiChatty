//
//  HeroCellView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 17/5/25.
//

import SwiftUI

struct HeroCellView: View {
	var title: String? = "Title"
	var subTitle: String? = "Subtitle section"
	var imageURL: String? = GlobalConstants.randomImageURL
	var width: CGFloat? = 300
	var height: CGFloat? = 200
	var alignment: Alignment? = .center

	private struct Constants {
		static let radius: CGFloat = 16
		static let textSpacing: CGFloat = 4
		static let accessibilityLabel: String = "Avatar Hero Image"
		static let defaultWidth: CGFloat = 300
		static let defaultHeight: CGFloat = 200
		static let defaultAlignment: Alignment = .center
	}

    var body: some View {
		ZStack {
			if let imageURL {
				ImageLoaderView(
					imageURL: imageURL,
					resizeMode: .fill
				)
				.clipShape(RoundedRectangle(cornerRadius: Constants.radius))
			} else {
				RoundedRectangle(cornerRadius: Constants.radius)
					.fill(.accent)
			}
		}
		.accessibilityIdentifier(Constants.accessibilityLabel)
		.overlay(alignment: .bottomLeading) {
			textSectionView
		}
		.frame(
			width: width ?? Constants.defaultWidth,
			height: height ?? Constants.defaultHeight,
			alignment: alignment ?? Constants.defaultAlignment
		)
    }

	var textSectionView: some View {
		VStack(alignment: .leading, spacing: Constants.textSpacing) {
			if let title {
				AppTextView(
					text: title,
					font: .headline,
					color: .white
				)
			}
			if let subTitle {
				AppTextView(
					text: subTitle,
					font: .subheadline,
					color: .white
				)
			}
		}
		.padding()
		.frame(maxWidth: .infinity, alignment: .leading)
		.background(
			LinearGradient(
				colors: [.black.opacity(0), .black.opacity(0.3), .black.opacity(0.4)],
				startPoint: .top,
				endPoint: .bottom
			)
			.clipShape(RoundedRectangle(cornerRadius: Constants.radius))
		)
	}
}

#Preview {
	ScrollView {
		HeroCellView()
		HeroCellView(imageURL: nil)
		ScrollView(.horizontal) {
			HStack {
				HeroCellView(
					title: "Turtle",
					subTitle: nil,
					imageURL: GlobalConstants.randomImageURL,
					width: 150,
					height: 150,
					alignment: .center
				)
				HeroCellView(
					title: nil,
					subTitle: "Super Pigion",
					imageURL: nil,
					width: 150,
					height: 150,
					alignment: .center
				)
				HeroCellView(
					title: "Tiger",
					subTitle: "Tiger King",
					imageURL: GlobalConstants.randomImageURL,
					width: 150,
					height: 150,
					alignment: .center
				)
			}.padding()
		}
	}
	.frame(maxWidth: .infinity)
}
