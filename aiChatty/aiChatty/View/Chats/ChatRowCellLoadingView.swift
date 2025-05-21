//
//  ChatRowCellLoadingView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 20/5/25.
//

import SwiftUI

struct ChatRowCellLoadingView: View {
    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				ChatRowCellView(
					imageName: nil,
					headline: "Avatar",
					subHeadline: "This is the subhealine",
					newChat: false
				)
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.redacted(reason: .placeholder)
    }
}

#Preview {
    ChatRowCellLoadingView()
}
