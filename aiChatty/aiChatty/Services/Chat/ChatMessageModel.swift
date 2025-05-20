//
//  ChatMessageModel.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import Foundation

struct ChatMessageModel: Identifiable, Equatable {
	let id: UUID
	let chatId: UUID
	let authorId: UUID?
	let content: String?
	let seenByIds: [UUID]?
	let dateCreated: Date?

	init(
		id: UUID,
		chatId: UUID,
		authorId: UUID?,
		content: String?,
		seenByIds: [UUID]?,
		dateCreated: Date?
	) {
		self.id = id
		self.chatId = chatId
		self.authorId = authorId
		self.content = content
		self.seenByIds = seenByIds
		self.dateCreated = dateCreated
	}
}

// MARK: - ChatMessageModel Extension - Mock Data
extension ChatMessageModel {
	static let mock: ChatMessageModel = mocks.first!
	static let mocks: [ChatMessageModel] = [
		ChatMessageModel(
			id: .init(),
			chatId: .init(),
			authorId: .init(),
			content: "Hello there!",
			seenByIds: [.init(), .init()],
			dateCreated: Date(timeIntervalSinceNow: -3000)  // 50 minutes ago
		),
		ChatMessageModel(
			id: .init(),
			chatId: .init(),
			authorId: .init(),
			content: "How are you doing today?",
			seenByIds: [.init()],
			dateCreated: Date(timeIntervalSinceNow: -2400)  // 40 minutes ago
		),
		ChatMessageModel(
			id: .init(),
			chatId: .init(),
			authorId: .init(),
			content: "Don't forget the meeting at 3PM.",
			seenByIds: [],
			dateCreated: Date(timeIntervalSinceNow: -1800)  // 30 minutes ago
		),
		ChatMessageModel(
			id: UUID(uuidString: "dddd4444-4444-4444-4444-444444444444")!,
			chatId: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
			authorId: nil,
			content: nil,
			seenByIds: nil,
			dateCreated: nil
		)
	]
}
