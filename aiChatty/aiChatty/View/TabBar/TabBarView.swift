//
//  TabBarView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct TabBarView: View {

	private struct Constant {
		static let exploreIcon: String = "sailboat.fill"
		static let chatsIcon: String = "bubble.left.and.bubble.right.fill"
		static let profileIcon: String = "person.fill"
	}

	var body: some View {
		TabView {
			ExploreView()
			.tabItem {
				Label(Self.exploreText, systemImage: Constant.exploreIcon)
					.accessibilityIdentifier(Self.exploreText)
			}

			ChatsView()
			.tabItem {
				Label(Self.chatsText, systemImage: Constant.chatsIcon)
					.accessibilityIdentifier(Self.chatsText)
			}

			ProfileView()
			.tabItem {
				Label(Self.profileText, systemImage: Constant.profileIcon)
					.accessibilityIdentifier(Self.profileText)
			}
		}
	}
}

// MARK: - TabBarView Accessibility Extension
extension TabBarView {
	static let profileText: String = "Profile"
	static let chatsText: String = "Chats"
	static let exploreText: String = "Explore"
}

#Preview {
	TabBarView()
}
