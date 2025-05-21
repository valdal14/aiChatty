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
	@State private var isPremium: Bool = false
	@State private var isAnonymousUser: Bool = true
	@State private var showCreateAccountView: Bool = false

	private struct Constants {
		static let signOutText: String = "Sign out"
		static let signInText: String = "Save & backup account"
		static let navigationTitle: String = "Settings"
		static let accountSectionText: String = "Account"
		static let deleteButtonText: String = "Delete account"
		static let purchaseSectionText: String = "Purchase"
		static let accountStatusText: String = "Account status: "
		static let applicationSectionText: String = "Application"
		static let freeTierText: String = "FREE"
		static let premiumTierText: String = "PREMIUM"
		static let badgeText: String = "MANAGE"
	}

    var body: some View {
		NavigationStack {
			List {
				accountSection
				purchaseSection
				ApplicationSettingRecapView(
					version: GlobalConstants.appVersion,
					buildNumber: GlobalConstants.buildNumber,
					onTapContactUs: ({
						print("click contact us")
					})
				)
			}
			.navigationTitle(Constants.navigationTitle)
			.sheet(isPresented: $showCreateAccountView, content: {
				CreateAccountView()
					.presentationDetents([.medium])
			})
			.safeAreaInset(edge: .bottom) {
				AuthorView()
			}
		}
    }
}

// MARK: - SettingsView Extension - Account Section
private extension SettingsView {
	var accountSection: some View {
		Section {
			if isAnonymousUser {
				buttonSignIn
			} else {
				buttonSignOut
			}
			deleteAccountButton
		} header: {
			Text(Constants.accountSectionText)
		}
		.accessibilityIdentifier(Self.accountSectionIdentifier)
	}

	var buttonSignOut: some View {
		AppTextView(
			text: Constants.signOutText,
			font: .body
		)
		.anyButton {
			onSignOutPressed()
		}
	}

	var buttonSignIn: some View {
		AppTextView(
			text: Constants.signInText,
			font: .body
		)
		.anyButton {
			onCreateAccountPressed()
		}
	}

	var deleteAccountButton: some View {
		AppTextView(
			text: Constants.deleteButtonText,
			font: .body,
			color: .accent
		)
		.anyButton {
			print("delete account")
		}
	}
}

// MARK: - SettingsView Extension - Purchase Section
private extension SettingsView {
	var purchaseSection: some View {
		Section {
			hStackContainer
		} header: {
			Text(Constants.purchaseSectionText)
		}
	}

	var hStackContainer: some View {
		HStack {
			AppTextView(
				text: "\(Constants.accountStatusText) \(isPremium ? Constants.premiumTierText : Constants.freeTierText)",
				font: .body
			)
			Spacer()
			manageTier()
		}
	}

	@ViewBuilder
	func manageTier() -> some View {
		if isPremium {
			NewBadgeView(
				text: Constants.badgeText,
				backgroundColor: .green
			)
			.anyButton {
				print("Manage premium tier")
			}
		}
	}
}

// MARK: - SettingsView Business Logic
private extension SettingsView {
	func onSignOutPressed() {
		rootAppState.updateViewState(showTabBarView: false)
	}

	func onCreateAccountPressed() {
		showCreateAccountView = true
	}
}

// MARK: - SettingsView Accessibility Helpers
private extension SettingsView {
	static let accountSectionIdentifier: String = "\(Constants.accountSectionText) section"
}

#Preview {
    SettingsView()
		.environment(AppState())
}
