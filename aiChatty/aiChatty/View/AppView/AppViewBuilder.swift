//
//  AppViewBuilder.swift
//  aiChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

// MARK: - AppViewBuilder

struct AppViewBuilder<TabBarView: View, OnboardingView: View>: View {
	var showTabBar: Bool = false
	@ViewBuilder var tabBarView: TabBarView
	@ViewBuilder var onboardingView: OnboardingView

	var body: some View {
		ZStack {
			makeContent(showTabBar)
		}
		.ignoresSafeArea(edges: .all)
		.animation(.smooth, value: showTabBar)
	}

	@ViewBuilder
	private func makeContent(_ showTabBar: Bool) -> some View {
		if showTabBar {
			tabBarView
			.transition(.move(edge: .trailing))
		} else {
			onboardingView
			.transition(.move(edge: .leading))
		}
	}
}

// MARK: - PreviewAppView

private struct PreviewAppView: View {
	@State private var showTabBar: Bool = false
	var body: some View {
		AppViewBuilder(
			showTabBar: showTabBar,
			tabBarView: ({
				ZStack {
					Color.red
					Text("TabBar")
				}
				.transition(.move(edge: .trailing))
			}),
			onboardingView: ({
				ZStack {
					Color.blue
					Text("Onboarding")
				}
				.transition(.move(edge: .leading))
			})
		)
		.onTapGesture {
			showTabBar.toggle()
		}
	}
}

#Preview {
	PreviewAppView()
}
