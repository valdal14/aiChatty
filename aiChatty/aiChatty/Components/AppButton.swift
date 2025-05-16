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
	@Binding var isActionCompleted: Bool
	let onTap: () -> Void

	private struct Constants {
		static let buttonHeight: CGFloat = 55
		static let buttonCornerRadius: CGFloat = 16
	}

	private var accessibilityLabel: String {
		"\(title) button"
	}

	init(
		title: String,
		colour: Color = .accent,
		isActionCompleted: Binding<Bool> = .constant(false),
		onTap: @escaping () -> Void
	) {
		self.title = title
		self.colour = colour
		self._isActionCompleted = isActionCompleted
		self.onTap = onTap
	}

	var body: some View {
		Button {
			onTap()
		} label: {
			buttonStyleView
		}
		.accessibilityIdentifier(accessibilityLabel)
		.disabled(isActionCompleted ? true : false)
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
				ZStack {
					if isActionCompleted {
						ProgressView()
							.tint(.white)
					} else {
						Text(title)
							.font(.headline)
							.foregroundStyle(.white)
					}
				}
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
