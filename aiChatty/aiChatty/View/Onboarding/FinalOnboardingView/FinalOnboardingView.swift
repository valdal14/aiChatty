//
//  FinalOnboardingView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct FinalOnboardingView: View {
	@Environment(AppState.self) private var rootAppState

	struct Constants {
		static let message: String = "Onboarding Completed!"
		static let buttonTitle: String = "Finish"
		static let vStackPadding: CGFloat = 16
	}

    var body: some View {
		VStack {
			Text(Constants.message)
				.accessibilityIdentifier(Constants.message)
				.frame(maxHeight: .infinity)

			AppButton(
				title: Constants.buttonTitle,
				onTap: ({
					onFinishButtonPressed()
				})
			)
		}
		.padding(Constants.vStackPadding)
    }
}

// MARK: - FinalOnboardingView Business Logic
private extension FinalOnboardingView {
	func onFinishButtonPressed() {
		rootAppState.updateViewState(showTabBarView: true)
	}
}

#Preview {
    FinalOnboardingView()
		.environment(AppState())
}
