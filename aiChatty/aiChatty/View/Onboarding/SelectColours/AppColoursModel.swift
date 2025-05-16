//
//  AppColoursModel.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

enum AppColoursModel: String, CaseIterable {
	case blue
	case cyan
	case green
	case indigo
	case mint
	case orange
	case pink
	case purple
	case red

	var toString: String {
		return self.rawValue
	}
}

extension AppColoursModel {
	static func mapColorToBackground(_ color: AppColoursModel) -> Color {
		switch color {
		case .blue:
			return .blue
		case .cyan:
			return .cyan
		case .green:
			return .green
		case .indigo:
			return .indigo
		case .mint:
			return .mint
		case .orange:
			return .orange
		case .pink:
			return .pink
		case .purple:
			return .purple
		case .red:
			return .red
		}
	}
}
