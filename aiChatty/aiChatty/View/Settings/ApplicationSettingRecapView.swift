//
//  ApplicationSettingRecapView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 21/5/25.
//

import SwiftUI

struct ApplicationSettingRecapView: View {
	let version: String
	let buildNumber: String
	let onTapContactUs: () -> Void

	private struct Constants {
		static let applicationSectionText: String = "Application"
		static let contactUsText: String = "Contact us"
		static let versionText: String = "Version"
		static let buildNumberText: String = "Build Number"
	}

    var body: some View {
		applicationSection
    }

	var applicationSection: some View {
		Section {
			vStackContainer
		} header: {
			Text(Constants.applicationSectionText)
		}
		.accessibilityIdentifier(Self.appSectionIdentifier)
	}

	var vStackContainer: some View {
		VStack(alignment: .leading) {
			SettingTableView(
				text: Constants.versionText,
				stringNumber: version
			)
			Divider()
			SettingTableView(
				text: Constants.buildNumberText,
				stringNumber: buildNumber
			)
			Divider()
			contactUSButton
		}
	}

	var contactUSButton: some View {
		AppTextView(
			text: Constants.contactUsText,
			font: .body,
			color: .blue
		)
		.anyButton {
			onTapContactUs()
		}
	}
}

// MARK: - ApplicationSettingRecapView Accessibility Helpers
private extension ApplicationSettingRecapView {
	static let appSectionIdentifier: String = "\(Constants.applicationSectionText) section"
}

// MARK: - SettingTableView
struct SettingTableView: View {
	let text: String
	let stringNumber: String

	var body: some View {
		HStack {
			AppTextView(text: text)
			Spacer()
			AppTextView(text: stringNumber)
		}
	}
}

// MARK: - ApplicationSettingRecapView Preview
#Preview {
	ApplicationSettingRecapView(
		version: "1.0",
		buildNumber: "3",
		onTapContactUs: ({})
	)
}
