//
//  ChatsView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct ChatsView: View {
	@State private var chats: [ChatModel] = ChatModel.mocks

	var body: some View {
		NavigationStack {
			List {
				ForEach(chats.indices, id: \.self) { chatId in
					ChatRowCellViewBuilder(
						// FIXME: Add UUID
						currentUserId: .init(),
						chat: chats[chatId],
						getAvatar: ({
							try? await Task.sleep(for: .seconds(2))
							return .mocks[chatId]
						}),
						getLastChatMessage: ({
							return .mocks[chatId]
						})
					)
					.anyButton(.highlight, action: ({
						print("Clicked")
					}))
					.listRowFormatting()
				}
			}
		}
	}
}

#Preview {
	ChatsView()
}
