//
//  AppTextView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

struct AppTextView: View {
	let text: String
	let font: Font
	let weight: Font.Weight
	let color: Color

	var accessibilityText: String {
		"\(text) Text"
	}

	init(
		text: String,
		font: Font = .body,
		weight: Font.Weight = .regular,
		color: Color = .primary
	) {
		self.text = text
		self.font = font
		self.weight = weight
		self.color = color
	}

    var body: some View {
		Text(text)
			.font(font)
			.foregroundStyle(color)
			.accessibilityIdentifier(accessibilityText)
    }
}

#Preview {
	AppTextView(
		text: "Welcome",
		font: .headline,
		weight: .semibold,
		color: .accent
	)
}
