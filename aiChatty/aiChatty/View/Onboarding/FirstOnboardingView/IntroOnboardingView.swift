//
//  IntroOnboardingView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

struct IntroOnboardingView: View {
	@State var randomImage: String = GlobalConstants.randomImageURL
	@State private var isNavigating: Bool = false

	struct Constants {
		static let avatarMessage1: String = "Make your own "
		static let avatarMessage2: String = " and chat with them!\n\nHave "
		static let avatarText: String = "avatars"
		static let conversationText: String = "real conversations"
		static let conversationMessage1: String = " with AI generated responses."
		static let buttonTitle: String = "Continue"
		static let ctaPadding: CGFloat = 16
		static let baseLineOffset: CGFloat = 6
	}

	var accessibilityText: String {
		Constants.avatarMessage1 +
		Constants.avatarText +
		Constants.avatarMessage2 +
		Constants.conversationText +
		Constants.conversationMessage1
	}

    var body: some View {
		VStack {
			imageView

			VStack {
				Text(Constants.avatarMessage1)
				+
				Text(Constants.avatarText)
					.foregroundStyle(.accent)
					.fontWeight(.semibold)
				+
				Text(Constants.avatarMessage2)
				+
				Text(Constants.conversationText)
					.foregroundStyle(.accent)
					.fontWeight(.semibold)
				+
				Text(Constants.conversationMessage1)
			}
			.baselineOffset(Constants.baseLineOffset)
			.frame(maxWidth: .infinity)
			.accessibilityIdentifier(accessibilityText)
			.padding()

			getStartedButtonView
		}
		.font(.title3)
		.navigationDestination(isPresented: $isNavigating) {
			SelectColorOnboardingView()
				.transition(.move(edge: .trailing))
		}
		.toolbar(.hidden, for: .navigationBar)
    }

	// MARK: - View Helpers
	private var imageView: some View {
		ImageLoaderView(imageURL: randomImage)
			.ignoresSafeArea()
	}

	private var getStartedButtonView: some View {
		AppButton(
			title: Constants.buttonTitle,
			onTap: ({
				onAppButtonPressed()
			})
		)
		.padding(Constants.ctaPadding)
	}
}

// MARK: - IntroOnboardingView Business Logic
private extension IntroOnboardingView {
	func onAppButtonPressed() {
		isNavigating.toggle()
	}
}

#Preview {
    IntroOnboardingView()
}
