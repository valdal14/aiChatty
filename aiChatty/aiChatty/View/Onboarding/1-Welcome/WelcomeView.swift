//
//  WelcomeView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct WelcomeView: View {
	@State private var isNavigating: Bool = false
	@State var randomImage: String = GlobalConstants.randomImageURL
	@State private var showSignInView: Bool = false

	struct Constants {
		static let buttonTitle: String = "Get Started"
		static let ctaPadding: CGFloat = 16
		static let titlePadding: CGFloat = 24
		static let accountMessage: String = "Already have an account? Sign in!"
		static let termMessage: String = "Privacy Policy"
		static let privacyMessage: String = "Terms of Service"
		static let separatorText: String = " | "
		static let spacing: CGFloat = 8
		static let appleSignInText: String = "Sign in"
		static let appleSignInSubText: String = "Connect to an existing Apple's account."
	}

    var body: some View {
		NavigationStack {
			VStack(spacing: Constants.spacing) {
				imageView
				titleView
				getStartedButtonView
				signInButtonView
				termsAndPrivacyView
			}
			.navigationDestination(
				isPresented: $isNavigating,
				destination: ({
					IntroOnboardingView()
						.transition(.move(edge: .trailing))
				})
			)
		}
		.animation(.smooth, value: isNavigating)
		.transition(.move(edge: .leading))
		.sheet(
			isPresented: $showSignInView,
			content: {
				CreateAccountView(
					title: Constants.appleSignInText,
					subTitle: Constants.appleSignInSubText
				)
				.presentationDetents([.medium])
		})
    }

	// MARK: - View Helpers
	private var imageView: some View {
		ImageLoaderView(imageURL: randomImage)
			.ignoresSafeArea()
	}

	private var titleView: some View {
		AppTextView(
			text: GlobalConstants.appName,
			font: .largeTitle,
			weight: .semibold,
			color: .primary
		)
		.padding(.top, Constants.ctaPadding)
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

	private var signInButtonView: some View {
		Button {
			onSignInPressed()
		} label: {
			AppTextView(text: Constants.accountMessage)
				.padding(Constants.spacing)
				.underline()
		}
		.tint(.primary)
	}

	private var termsAndPrivacyView: some View {
		HStack(spacing: Constants.spacing) {
			AppLinkView(
				appURL: GlobalConstants.termsURL,
				urlText: Constants.termMessage
			)
			Text(Constants.separatorText)
			AppLinkView(
				appURL: GlobalConstants.privacyURL,
				urlText: Constants.privacyMessage
			)
		}
		.foregroundStyle(.accent)
	}
}

// MARK: - WelcomeView Business Logic
private extension WelcomeView {
	func onAppButtonPressed() {
		isNavigating.toggle()
	}
	
	func onSignInPressed() {
		showSignInView = true
	}
}

#Preview {
    WelcomeView()
}
