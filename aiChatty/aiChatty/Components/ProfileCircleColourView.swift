//
//  ProfileCircleColourView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import SwiftUI

struct ProfileCircleColourView: View {
	let currentUser: UserModel?

	private struct Constants {
		static let circleSize: CGFloat = 100
		static let accessibilitiesLabel: String = "Profile circle colour"
	}

    var body: some View {
		Circle()
			.fill(currentUser?.computedProfileColor ?? .accent)
			.frame(width: Constants.circleSize, height: Constants.circleSize, alignment: .center)
			.accessibilityIdentifier(Constants.accessibilitiesLabel)
			.frame(maxWidth: .infinity)
    }
}

#Preview {
	ProfileCircleColourView(
		currentUser: UserModel.mock
	)
}
