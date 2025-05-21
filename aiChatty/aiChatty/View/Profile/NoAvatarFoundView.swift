//
//  NoAvatarFoundView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import SwiftUI

struct NoAvatarFoundView: View {
	let onClick: () -> Void

	private struct Constants {
		static let noAvatarText: String = "No avatar found"
		static let clickToAddText: String = "Click here to add a new avatar"
	}
    var body: some View {
		ContentUnavailableView(
			label: { label },
			description: { button }
		)
		.listRowFormatting()
    }

	// MARK: UI Helpers
	var label: some View {
		Label(
			Constants.noAvatarText,
			systemImage: "person.fill"
		)
		.accessibilityIdentifier(Constants.noAvatarText)
	}

	var button: some View {
		Text("Click here to add a new plant")
				.accessibilityIdentifier(Constants.clickToAddText)
				.anyButton {
					onClick()
				}
				.foregroundStyle(.accent)
	}
}

#Preview {
	NoAvatarFoundView(onClick: ({}))
}
