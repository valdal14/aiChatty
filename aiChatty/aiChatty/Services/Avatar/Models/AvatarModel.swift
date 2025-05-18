//
//  AvatarModel.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 18/5/25.
//

import Foundation

enum CharacterOption: String {
	case man, woman, alien, dog, cat

	static var `default`: Self {
		return .man
	}
}

enum CharacterAction: String {
	case smiling, sitting, eating, drinking, walking, shopping, studying, working, sleeping, relaxing

	static var `default`: Self {
		return .smiling
	}
}

enum CharacterLocation: String {
	case park, mall, museum, beach, forest, city, mountain, space, desert

	static var `default`: Self {
		return .park
	}
}

struct AvatarModel: Hashable, Identifiable {
	let id: UUID
	let name: String?
	let characterOption: CharacterOption?
	let characterAction: CharacterAction?
	let characterLocation: CharacterLocation?
	let profileImageName: String?
	let authorId: UUID?
	let dateCreated: Date?

	init(
		id: UUID,
		name: String? = nil,
		characterOption: CharacterOption? = nil,
		characterAction: CharacterAction? = nil,
		characterLocation: CharacterLocation? = nil,
		profileImageName: String? = nil,
		authorId: UUID? = nil,
		dateCreated: Date? = nil
	) {
		self.id = id
		self.name = name
		self.characterOption = characterOption
		self.characterAction = characterAction
		self.characterLocation = characterLocation
		self.profileImageName = profileImageName
		self.authorId = authorId
		self.dateCreated = dateCreated
	}

	var characterDescription: String {
		if let action = self.characterAction, let description = self.characterLocation, let option = self.characterOption {
			return "A \(option.rawValue) that is \(action.rawValue) in the middle of a \(description.rawValue)"
		} else {
			let first: String = "A \(CharacterOption.default.rawValue)"
			let second: String = " that is \(CharacterAction.default.rawValue)"
			let third: String = " in the middle of a \(CharacterLocation.default.rawValue)"
			return first + second + third
		}
	}
}

extension AvatarModel {
	static let mocks: [AvatarModel] = [
		.init(
			id: UUID(),
			name: "Valerio",
			characterOption: .man,
			characterAction: .sitting,
			characterLocation: .city,
			profileImageName: GlobalConstants.randomImageURL,
			authorId: .init(),
			dateCreated: .now
		),
		.init(
			id: UUID(),
			name: "Maria",
			characterOption: .woman,
			characterAction: .drinking,
			characterLocation: .mall,
			profileImageName: GlobalConstants.randomImageURL,
			authorId: .init(),
			dateCreated: .now
		),
		.init(
			id: UUID(),
			name: "Luna",
			characterOption: .alien,
			characterAction: .eating,
			characterLocation: .space,
			profileImageName: GlobalConstants.randomImageURL,
			authorId: .init(),
			dateCreated: .now
		),
		.init(
			id: UUID(),
			name: "14",
			characterOption: .cat,
			characterAction: .relaxing,
			characterLocation: .beach,
			profileImageName: GlobalConstants.randomImageURL,
			authorId: .init(),
			dateCreated: .now
		)
	]

	static var mock: AvatarModel {
		mocks.first!
	}
}
