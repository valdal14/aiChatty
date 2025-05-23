//
//  GlobalConstants.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import Foundation

struct GlobalConstants {
	static let randomImageURL: String = "https://picsum.photos/600/600"
	static let appName: String = "AI Chatty"
	static let termsURL: URL = URL(string: "https://valdal14.github.io./support.html")!
	static let privacyURL: URL = URL(string: "https://valdal14.github.io./support.html")!
	static let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
	static let buildNumber: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "3"
}
