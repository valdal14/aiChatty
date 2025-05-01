//
//  AppView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct AppView: View {
	@AppStorage("showTabBarView") var showTabBar: Bool = false

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
    }
}

#Preview("AppView TabBar") {
	AppView(showTabBar: true)
}

#Preview("AppView Onboarding") {
	AppView(showTabBar: false)
}
