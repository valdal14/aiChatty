//
//  AppState.swift
//  aiChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

@Observable
class AppState {
	private static let key: String = "showTabBarView"

	private(set) var showTabBar: Bool {
		didSet {
			UserDefaults.showTabBarView = showTabBar
		}
	}

	init(showTabBar: Bool = UserDefaults.showTabBarView) {
		self.showTabBar = showTabBar
	}

	func updateViewState(showTabBarView: Bool) {
		showTabBar = showTabBarView
	}
}

extension UserDefaults {
	private static let key: String = "showTabBarView"

	static var showTabBarView: Bool {
		get {
			standard.bool(forKey: Self.key)
		} set {
			standard.set(newValue, forKey: Self.key)
		}
	}
}
