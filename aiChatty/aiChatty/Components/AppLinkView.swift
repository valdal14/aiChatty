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
	let font: Font

	init(appURL: URL, urlText: String, font: Font = .body) {
		self.appURL = appURL
		self.urlText = urlText
		self.font = font
	}

	var accessibilityText: String {
		"\(urlText) link"
	}

    var body: some View {
		Link(
			destination: appURL,
			label: ({
				Text(urlText)
					.font(font)
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
