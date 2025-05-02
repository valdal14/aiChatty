//
//  LoadingAnimationViewModifier.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

struct LoadingAnimationViewModifier: AnimatableModifier {
	@State private var isLoading: Bool = false
	private let animation: Animation = .easeOut(duration: 1.5)

	func body(content: Content) -> some View {
		content.overlay(loadingView.mask(content))
	}

	var loadingView: some View {
		GeometryReader { geo in
			ZStack {
				Color.black.opacity(0.1)
				Color.white.mask(
					Rectangle()
						.fill(
							LinearGradient(
								gradient: .init(
									colors: [
										.clear,
										.clear,
										.white.opacity(0.2),
										.clear,
										.clear
									]
								),
								startPoint: .leading,
								endPoint: .trailing
							)
						)
						.offset(x: isLoading ? geo.size.width : -geo.size.width)
				)
			}
			.animation(animation.repeatForever(autoreverses: false), value: isLoading)
			.onAppear {
				isLoading.toggle()
			}
		}
	}
}

public extension View {
	func loadingAnimation() -> some View {
		self.modifier(LoadingAnimationViewModifier())
	}
}
