//
//  NewBadgeView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import SwiftUI

struct NewBadgeView: View {
	let text: String
	let radius: CGFloat
	let backgroundColor: Color
	let textColor: Color
	let width: CGFloat
	let height: CGFloat

	init(
		text: String = "new",
		radius: CGFloat = 8,
		backgroundColor: Color = .accentColor,
		textColor: Color = .white,
		width: CGFloat = 60,
		height: CGFloat = 30
	) {
		self.text = text
		self.radius = radius
		self.backgroundColor = backgroundColor
		self.textColor = textColor
		self.width = width
		self.height = height
	}

    var body: some View {
		RoundedRectangle(cornerRadius: radius)
			.frame(width: width, height: height)
			.foregroundStyle(backgroundColor)
			.overlay {
				AppTextView(
					text: text.uppercased(),
					font: .caption,
					weight: .semibold,
					color: textColor
				)
			}
    }
}

#Preview {
	VStack {
		NewBadgeView(
			text: "new",
			radius: 8,
			backgroundColor: .accent,
			textColor: .white
		)
		NewBadgeView(
			text: "done",
			backgroundColor: .green
		)
	}
}
