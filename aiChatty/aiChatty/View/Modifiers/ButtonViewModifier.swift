//
//  ButtonViewModifier.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 19/5/25.
//

import SwiftUI

enum ButtonStyleOption {
	case highlight, plain
}

struct HighlightButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.overlay {
				configuration.isPressed ? .accent.opacity(0.4) : Color.accentColor.opacity(0)
			}
			.animation(.smooth, value: configuration.isPressed)
	}
}

extension View {

	@ViewBuilder
	func anyButton(_ buttonStyle: ButtonStyleOption = .plain, action: @escaping () -> Void) -> some View {
		switch buttonStyle {
		case .highlight:
			self.highlightButton(action: action)
		case .plain:
			self.plainButton(action: action)
		}
	}

	private func plainButton(action: @escaping () -> Void) -> some View {
		Button {
			action()
		} label: {
			self
		}
		.buttonStyle(.plain)
	}

	private func highlightButton(action: @escaping () -> Void) -> some View {
		Button {
			action()
		} label: {
			self
		}
		.buttonStyle(HighlightButtonStyle())
	}
}

#Preview {
	VStack {

		Text("Hello World!")
			.padding()
			.frame(maxWidth: .infinity)
			.anyButton(.highlight, action: {})

		Text("Hello World!")
			.padding()
			.frame(maxWidth: .infinity)
			.anyButton(.plain, action: {})
	}
}
