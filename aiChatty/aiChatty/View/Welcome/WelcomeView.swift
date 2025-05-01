//
//  WelcomeView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct WelcomeView: View {
	@State private var isNavigating: Bool = false

	struct Constants {
		static let message: String = "Welcome"
		static let buttonTitle: String = "Get Started"
		static let vStackPadding: CGFloat = 16
	}

    var body: some View {
		NavigationStack {
			VStack {
				Text(Constants.message)
					.accessibilityIdentifier(Constants.message)
					.frame(maxHeight: .infinity)

				AppButton(
					title: Constants.buttonTitle,
					onTap: ({
						onAppButtonPressed()
					})
				)
			}
			.navigationDestination(
				isPresented: $isNavigating,
				destination: ({
					FinalOnboardingView()
						.transition(.move(edge: .trailing))
				})
			)
			.padding(Constants.vStackPadding)
		}
		.animation(.smooth, value: isNavigating)
		.transition(.move(edge: .leading))
    }
}

// MARK: - WelcomeView Business Logic
private extension WelcomeView {
	func onAppButtonPressed() {
		isNavigating.toggle()
	}
}

#Preview {
    WelcomeView()
}
