//
//  CreateAccountView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 21/5/25.
//

import SwiftUI

struct CreateAccountView: View {
	let title: String
	let subTitle: String
	
	init(
		title: String = "Create Account",
		subTitle: String = "Keep your chats available across devices."
	) {
		self.title = title
		self.subTitle = subTitle
	}
	private struct Constants {
		static let outerVStackSpacing: CGFloat = 24
		static let innerVStackSpacing: CGFloat = 8
		static let containerPadding: CGFloat = 16
		static let topPadding: CGFloat = 40
	}

    var body: some View {
		vStackOuterContainer
			.safeAreaInset(edge: .bottom) {
				signInWithAppleButton
			}
    }

	var vStackOuterContainer: some View {
		VStack(spacing: Constants.outerVStackSpacing) {
			vStackInnerContainer
		}
		.padding(Constants.containerPadding)
		.padding(.top, Constants.topPadding)
	}

	var vStackInnerContainer: some View {
		VStack(alignment: .leading, spacing: Constants.innerVStackSpacing) {
			createAccountView
			createAccountDescriptionView
		}
		.frame(maxWidth: .infinity, alignment: .leading)
	}

	var createAccountView: some View {
		AppTextView(
			text: title,
			font: .largeTitle,
			weight: .semibold
		)
	}

	var createAccountDescriptionView: some View {
		AppTextView(
			text: subTitle,
			font: .body
		)
	}
	
	var signInWithAppleButton: some View {
		Button {
			print("Sign in with Apple")
		} label: {
			SignWithAppleView(
				type: .signIn,
				style: .black,
				cornerRadius: 10,
				size: 55
			)
		}

	}
}

#Preview {
    CreateAccountView()
}
