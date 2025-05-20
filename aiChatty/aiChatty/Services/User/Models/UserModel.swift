//
//  UserModel.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import SwiftUI

struct UserModel: Identifiable, Equatable {
	let id: UUID
	let dateCreated: Date?
	let didCompleteOnboarding: Bool?
	let profileColorHex: String?

	init(
		id: UUID,
		dateCreated: Date? = nil,
		didCompleteOnboarding: Bool? = nil,
		profileColorHex: String? = nil
	) {
		self.id = id
		self.dateCreated = dateCreated
		self.didCompleteOnboarding = didCompleteOnboarding
		self.profileColorHex = profileColorHex
	}

	var computedProfileColor: Color {
		guard let profileColorHex else { return .accent }
		return Color(hex: profileColorHex)
	}
}

// MARK: UserModel Extension - Mock Data
extension UserModel {
	static let mock: UserModel = mocks.first!
	static let mocks: [UserModel] = [
		.init(
			id: .init(),
			dateCreated: .now,
			didCompleteOnboarding: false,
			profileColorHex: "#7F55B1"
		),
		.init(
			id: .init(),
			dateCreated: .now,
			didCompleteOnboarding: true,
			profileColorHex: "#FE5D26"
		),
		.init(
			id: .init(),
			dateCreated: .now,
			didCompleteOnboarding: true,
			profileColorHex: "#C1DBB3"
		),
		.init(
			id: .init(),
			dateCreated: .now,
			didCompleteOnboarding: true,
			profileColorHex: "#129990"
		)
	]
}
