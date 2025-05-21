//
//  SignWithAppleView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 21/5/25.
//

import SwiftUI
import AuthenticationServices

struct SignWithAppleView: View {
	let type: ASAuthorizationAppleIDButton.ButtonType
	let style: ASAuthorizationAppleIDButton.Style
	let cornerRadius: CGFloat
	let size: CGFloat
	
	init(
		type: ASAuthorizationAppleIDButton.ButtonType = .signIn,
		style: ASAuthorizationAppleIDButton.Style = .black,
		cornerRadius: CGFloat = 10,
		size: CGFloat = 50
	) {
		self.type = type
		self.style = style
		self.cornerRadius = cornerRadius
		self.size = size
	}
	
	public var body: some View {
		ZStack {
			Color.black.opacity(0.001)
			SignInWithAppleButtonViewRepresentable(type: type, style: style, cornerRadius: cornerRadius)
				.disabled(true)
				.frame(height: size)
		}
		.padding()
	}
}

private struct SignInWithAppleButtonViewRepresentable: UIViewRepresentable {
	let type: ASAuthorizationAppleIDButton.ButtonType
	let style: ASAuthorizationAppleIDButton.Style
	let cornerRadius: CGFloat
	
	func makeUIView(context: Context) -> some UIView {
		let button = ASAuthorizationAppleIDButton(type: type, style: style)
		button.cornerRadius = cornerRadius
		return button
	}
	
	func updateUIView(_ uiView: UIViewType, context: Context) {}
	
	func makeCoordinator() {}
}

#Preview {
	SignWithAppleView(
		type: .signUp,
		style: .black
	)
}
