//
//  AppView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct AppView: View {
	@State var appState: AppState = AppState()

    var body: some View {
		AppViewBuilder(
			showTabBar: appState.showTabBar,
			tabBarView: ({
				TabBarView()
			}),
			onboardingView: ({
				WelcomeView()
			})
		)
		.environment(appState)
    }
}

#Preview("AppView TabBar") {
	AppView(appState: .init(showTabBar: true))
}

#Preview("AppView Onboarding") {
	AppView(appState: .init(showTabBar: false))
}
