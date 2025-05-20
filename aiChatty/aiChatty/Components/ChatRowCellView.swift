//
//  ChatRowCellView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import SwiftUI

struct ChatRowCellView: View {
	let imageName: String?
	let headline: String?
	let subHeadline: String?
	let newChat: Bool

	private struct Constants {
		static let hStackHeight: CGFloat = 70
		static let circleSize: CGFloat = 50
		static let vStackContainerSpace: CGFloat = 4
		static let hStackSpacing: CGFloat = 8
		static let badgeTrailingPadding: CGFloat = 6
		static let horizontalPadding: CGFloat = 8
		static let verticalPadding: CGFloat = 12
	}

	init(
		imageName: String?,
		headline: String?,
		subHeadline: String?,
		newChat: Bool
	) {
		self.imageName = imageName
		self.headline = headline
		self.subHeadline = subHeadline
		self.newChat = newChat
	}

    var body: some View {
		hStackContainer
    }
}

// MARK: - ChatRowCellView Extension - View Helpers
private extension ChatRowCellView {

	private var hStackContainer: some View {
		HStack(spacing: Constants.hStackSpacing) {
			circleImage
			vStackContainer
			Spacer()
			if newChat {
				NewBadgeView()
					.padding(.trailing, Constants.badgeTrailingPadding)
			}
		}
		.padding(.vertical, Constants.verticalPadding)
		.padding(.horizontal, Constants.horizontalPadding)
		.background(Color(uiColor: .systemBackground))
	}

	private var circleImage: some View {
		ZStack {
			if let imageName {
				ImageLoaderView(imageURL: imageName, resizeMode: .fill)
					.clipShape(.circle)
					.frame(width: Constants.circleSize, height: Constants.circleSize)
			} else {
				Circle()
					.fill(Color.gray.opacity(0.5))
					.frame(width: Constants.circleSize, height: Constants.circleSize)
			}
		}
	}

	private var vStackContainer: some View {
		VStack(alignment: .leading, spacing: Constants.vStackContainerSpace) {
			if let headline {
				AppTextView(
					text: headline,
					font: .headline
				)
			}

			if let subHeadline {
				AppTextView(
					text: subHeadline,
					font: .subheadline
				)
			}
		}
	}
}

// MARK: - ChatRowCellView Preview
#Preview {
	ZStack {
		Color.gray.opacity(0.5)
			.ignoresSafeArea()

		List {
			ChatRowCellView(
				imageName: GlobalConstants.randomImageURL,
				headline: "Valerio",
				subHeadline: "This is the latest update",
				newChat: true
			).listRowFormatting()

			ChatRowCellView(
				imageName: nil,
				headline: "Mario",
				subHeadline: "I hope you are doing well",
				newChat: true
			).listRowFormatting()
			
			ChatRowCellView(
				imageName: nil,
				headline: "Lisa",
				subHeadline: "This was my last message",
				newChat: false
			).listRowFormatting()
		}
	}
}
