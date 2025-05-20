//
//  ChatRowCellViewBuilder.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import SwiftUI

struct ChatRowCellViewBuilder: View {
	let currentUserId: UUID?
	let chat: ChatModel
	let getAvatar: () async -> AvatarModel?
	let getLastChatMessage: () async -> ChatMessageModel?

	@State private var avatar: AvatarModel?
	@State private var lastChatMessage: ChatMessageModel?
	@State private var didLoadAvatar: Bool = false
	@State private var didLoadLastChatMessage: Bool = false
	@State private var didLoad: Bool = false

    var body: some View {
		VStack {
			if didLoadAvatar && didLoadLastChatMessage {
				ChatRowCellView(
					imageName: avatar?.profileImageName,
					headline: avatar?.name,
					subHeadline: lastChatMessage?.content,
					newChat: showBadge()
				)
			} else {
				ChatRowCellLoadingView()
			}
		}
		.task {
			avatar = await getAvatar()
		}
		.task {
			lastChatMessage = await getLastChatMessage()
		}
		.onChange(of: avatar) { _, newValue in
			if newValue != nil {
				didLoadAvatar.toggle()
			}
		}
		.onChange(of: lastChatMessage) { _, newValue in
			if newValue != nil {
				didLoadLastChatMessage.toggle()
			}
		}
    }
}

// MARK: - ChatRowCellViewBuilder Extension - Business Logic
private extension ChatRowCellViewBuilder {
	func showBadge() -> Bool {
		if let userId = currentUserId, let lastChatMessage {
			return ((lastChatMessage.seenByIds?.contains(userId)) != nil)
		} else {
			return false
		}
	}
}

#Preview {
	VStack {
		ChatRowCellViewBuilder(
			currentUserId: nil,
			chat: .mock,
			getAvatar: ({
				try? await Task.sleep(for: .seconds(7))
				return .mock
			}),
			getLastChatMessage: ({
				try? await Task.sleep(for: .seconds(5))
				return .mock
			})
		)
		ChatRowCellViewBuilder(
			currentUserId: .init(),
			chat: .mock,
			getAvatar: ({
				try? await Task.sleep(for: .seconds(7))
				return .mock
			}),
			getLastChatMessage: ({
				try? await Task.sleep(for: .seconds(5))
				return .mock
			})
		)
		ChatRowCellViewBuilder(
			currentUserId: .init(),
			chat: .mock,
			getAvatar: ({
				try? await Task.sleep(for: .seconds(7))
				return nil
			}),
			getLastChatMessage: ({
				try? await Task.sleep(for: .seconds(5))
				return nil
			})
		)
	}
}
