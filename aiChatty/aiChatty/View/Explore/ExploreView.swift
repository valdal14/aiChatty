//
//  ExploreView.swift
//  aiChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import UIKit
import SwiftUI

struct ExploreView: View {
	let screenWidth: CGFloat = UIScreen.main.bounds.width - 50
	let avatar: AvatarModel = .mock
	var body: some View {
		NavigationStack {
			HeroCellView(
				title: avatar.name,
				subTitle: avatar.characterDescription,
				imageURL: avatar.profileImageName,
				width: screenWidth
			)
			.navigationTitle("Explore")
		}
	}
}

#Preview {
	ExploreView()
}
