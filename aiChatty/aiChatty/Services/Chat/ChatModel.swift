//
//  ChatModel.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import Foundation

struct ChatModel: Identifiable {
	let id: UUID
	let userId: UUID
	let avatarId: UUID
	let dateCreated: Date
	let dateModified: Date

	init(
		id: UUID,
		userId: UUID,
		avatarId: UUID,
		dateCreated: Date,
		dateModified: Date
	) {
		self.id = id
		self.userId = userId
		self.avatarId = avatarId
		self.dateCreated = dateCreated
		self.dateModified = dateModified
	}
}

// MARK: - ChatModel Extension - Mock Data
extension ChatModel {
	static let mock: ChatModel = mocks.first!

	static let mocks: [ChatModel] = [
		ChatModel(
			id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
			userId: UUID(uuidString: "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa")!,
			avatarId: UUID(uuidString: "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb")!,
			dateCreated: Date(timeIntervalSinceNow: -3600),   // 1 hour ago
			dateModified: Date(timeIntervalSinceNow: -1800)   // 30 mins ago
		),
		ChatModel(
			id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!,
			userId: UUID(uuidString: "cccccccc-cccc-cccc-cccc-cccccccccccc")!,
			avatarId: UUID(uuidString: "dddddddd-dddd-dddd-dddd-dddddddddddd")!,
			dateCreated: Date(timeIntervalSinceNow: -7200),   // 2 hours ago
			dateModified: Date(timeIntervalSinceNow: -3600)   // 1 hour ago
		),
		ChatModel(
			id: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!,
			userId: UUID(uuidString: "eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee")!,
			avatarId: UUID(uuidString: "ffffffff-ffff-ffff-ffff-ffffffffffff")!,
			dateCreated: Date(timeIntervalSinceNow: -10800),  // 3 hours ago
			dateModified: Date(timeIntervalSinceNow: -5400)   // 1.5 hours ago
		),
		ChatModel(
			id: UUID(uuidString: "44444444-4444-4444-4444-444444444444")!,
			userId: UUID(uuidString: "99999999-9999-9999-9999-999999999999")!,
			avatarId: UUID(uuidString: "88888888-8888-8888-8888-888888888888")!,
			dateCreated: Date(timeIntervalSinceNow: -14400),  // 4 hours ago
			dateModified: Date(timeIntervalSinceNow: -6000)   // 1.67 hours ago
		)
	]
}
