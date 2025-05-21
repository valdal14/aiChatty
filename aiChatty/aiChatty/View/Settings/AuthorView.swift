//
//  AuthorView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 21/5/25.
//

import SwiftUI

struct AuthorView: View {
	private struct Constants {
		static let title: String = "Created by Valerio D'Alessio"
		static let subtitle: String = "@valdal14"
		static let linkedinURL: URL = URL(string: "https://www.linkedin.com/in/valdal14")!
		static let vStackSpacing: CGFloat = 6
	}

    var body: some View {
		VStack(spacing: Constants.vStackSpacing) {
			AppTextView(
				text: Constants.title,
				font: .caption,
				color: .secondary
			)
			AppLinkView(
				appURL: Constants.linkedinURL,
				urlText: Constants.subtitle,
				font: .caption
			)
		}
    }
}

#Preview {
    AuthorView()
}
