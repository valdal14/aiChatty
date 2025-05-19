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
}
