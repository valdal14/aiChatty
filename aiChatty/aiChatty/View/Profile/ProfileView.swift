//
//  ProfileView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct ProfileView: View {
	@State private var showSettings: Bool = false
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
			Text("Settings View")
		}
	}

	// MARK: - ProfileView Helpers
	private var settingsButton: some View {
		Button(action: ({
			onSettingsButtonPressed()
		}), label: ({
			Image(systemName: "gear")
				.font(.headline)
		}))
	}
}

// MARK: - ProfileView Business Logic
private extension ProfileView {
	func onSettingsButtonPressed() {
		showSettings.toggle()
	}
}

#Preview {
	ProfileView()
}
