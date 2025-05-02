//
//  SettingsView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct SettingsView: View {
	@Environment(\.dismiss) private var dismiss
	@Environment(AppState.self) private var rootAppState

	private struct Constants {
		static let signOutText: String = "Sign out"
		static let signOutImageName: String = "person.slash.fill"
		static let navigationTitle: String = "Settings"
	}

    var body: some View {
		NavigationStack {
			List {
				buttonSignOut
			}
			.navigationTitle(Constants.navigationTitle)
		}
    }

	// MARK: - SettingsView View Helpers
	var buttonSignOut: some View {
		Button {
			dismiss()
			Task {
				try? await Task.sleep(for: .seconds(1))
				resetAppState()
			}
		} label: {
			Label(
				Constants.signOutText,
				systemImage: Constants.signOutImageName
			)
		}
		.accessibilityIdentifier(Self.buttonSignOutIdentifier)
	}
}

// MARK: - SettingsView Business Logic
private extension SettingsView {
	func resetAppState() {
		rootAppState.updateViewState(showTabBarView: false)
	}
}

// MARK: - SettingsView Accessibility Helpers
private extension SettingsView {
	static let buttonSignOutIdentifier: String = "\(Constants.signOutText) button"
}

#Preview {
    SettingsView()
		.environment(AppState())
}
