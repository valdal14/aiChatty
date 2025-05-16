//
//  FinalOnboardingView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct FinalOnboardingView: View {
	@Environment(AppState.self) private var rootAppState
	@State private var isSetupCompleted: Bool = false
	let colour: Color

	struct Constants {
		static let message: String = "Setup Completed!"
		static let description: String = "We have set up your profile, and you are now ready to chat."
		static let buttonTitle: String = "Finish"
		static let vStackPadding: CGFloat = 24
		static let textPadding: CGFloat = 8
	}

    var body: some View {
		VStack {
			AppTextView(
				text: Constants.message,
				font: .largeTitle,
				weight: .bold,
				color: colour
			)
			.padding(.bottom, Constants.textPadding)
			AppTextView(
				text: Constants.description,
				font: .title2
			)
		}
		.frame(maxHeight: .infinity)
		.safeAreaInset(edge: .bottom) {
			AppButton(
				title: Constants.buttonTitle,
				isActionCompleted: $isSetupCompleted,
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
		Task {
			isSetupCompleted = true
			#warning("Replace with the backend call")
			try await Task.sleep(for: .seconds(3))
			isSetupCompleted = false
			rootAppState.updateViewState(showTabBarView: true)
		}
	}
}

#Preview {
	FinalOnboardingView(colour: .red)
		.environment(AppState())
}
