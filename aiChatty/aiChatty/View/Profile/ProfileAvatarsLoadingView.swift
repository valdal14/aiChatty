//
//  ProfileAvatarsLoadingView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import SwiftUI

struct ProfileAvatarsLoadingView: View {
	var body: some View {
		VStack(alignment: .leading) {
			ChatRowCellView(
				imageName: nil,
				headline: "This is my avatar",
				subHeadline: nil,
				newChat: false
			)
			ChatRowCellView(
				imageName: nil,
				headline: "This is my avatar",
				subHeadline: nil,
				newChat: false
			)
			Divider()
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.redacted(reason: .placeholder)
	}
}

#Preview {
    ProfileAvatarsLoadingView()
}
