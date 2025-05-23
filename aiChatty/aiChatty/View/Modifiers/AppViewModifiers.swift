//
//  AppViewModifiers.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

extension View {
	public func listRowFormatting() -> some View {
		self
			.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
			.listRowBackground(Color.clear)
	}

	public func cellBackground() -> some View {
		self
			.background(
				LinearGradient(
					colors: [.black.opacity(0), .black.opacity(0.3), .black.opacity(0.4)],
					startPoint: .top,
					endPoint: .bottom
				)
				.clipShape(RoundedRectangle(cornerRadius: 16))
			)
	}

	public func profileCellShape(frameSize: CGFloat, radius: CGFloat) -> some View {
		self
			.aspectRatio(1, contentMode: .fit)
			.frame(width: frameSize)
			.cornerRadius(radius)
	}
}
