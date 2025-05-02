//
//  ProfileView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct ProfileView: View {
	@State private var showSettings: Bool = false

	private struct Constants {
		static let settingsButtonImage: String = "gear"
		static let settingButtonText: String = "Settings"
	}

	var body: some View {
		NavigationStack {
			Text("Profile")
				.navigationTitle("Profile")
				.toolbar {
					ToolbarItem(placement: .topBarTrailing) {
						settingsButton
					}
				}
		}
		.sheet(isPresented: $showSettings) {
			SettingsView()
		}
	}

	// MARK: - ProfileView Helpers
	private var settingsButton: some View {
		Button(action: ({
			onSettingsButtonPressed()
		}), label: ({
			Image(systemName: Constants.settingsButtonImage)
				.font(.headline)
		}))
		.accessibilityIdentifier(Self.settingsButtonIdentifier)
	}
}

// MARK: - ProfileView Business Logic
private extension ProfileView {
	func onSettingsButtonPressed() {
		showSettings.toggle()
	}
}

// MARK: - ProfileView Accessibility Helpers
private extension ProfileView {
	static let settingsButtonIdentifier: String = "\(Constants.settingButtonText) Button"
}

#Preview {
	ProfileView()
}
