//
//  AppLinkView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

struct AppLinkView: View {
	let appURL: URL
	let urlText: String

	var accessibilityText: String {
		"\(urlText) link"
	}

    var body: some View {
		Link(
			destination: appURL,
			label: ({
				Text(urlText)
			})
		)
		.accessibilityIdentifier(accessibilityText)
    }
}

#Preview {
	AppLinkView(
		appURL: GlobalConstants.termsURL,
		urlText: "Terms and Conditions"
	)
}
