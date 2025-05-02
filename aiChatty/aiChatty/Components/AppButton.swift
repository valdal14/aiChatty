//
//  AppButton.swift
//  aiChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct AppButton: View {
	let title: String
	let colour: Color
	let onTap: () -> Void

	private struct Constants {
		static let buttonHeight: CGFloat = 55
		static let buttonCornerRadius: CGFloat = 16
	}

	private var accessibilityLabel: String {
		"\(title) button"
	}

	init(title: String, colour: Color = .accent, onTap: @escaping () -> Void) {
		self.title = title
		self.colour = colour
		self.onTap = onTap
	}

	var body: some View {
		Button {
			onTap()
		} label: {
			buttonStyleView
		}
		.accessibilityIdentifier(accessibilityLabel)
	}

	var buttonStyleView: some View {
		RoundedRectangle(cornerRadius: Constants.buttonCornerRadius)
			.fill(colour)
			.frame(
				maxWidth: .infinity,
				minHeight: Constants.buttonHeight,
				maxHeight: Constants.buttonHeight
			)
			.overlay {
				Text(title)
					.font(.headline)
					.foregroundStyle(.white)
			}
	}
}

#Preview {
	AppButton(
		title: "Get Started",
		colour: .accent,
		onTap: ({})
	)
}
