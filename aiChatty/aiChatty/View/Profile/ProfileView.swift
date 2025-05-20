//
//  ProfileView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 1/5/25.
//

import SwiftUI

struct ProfileView: View {
	@State private var myAvatars: [AvatarModel] = []
	@State private var currentUser: UserModel? = UserModel.mock
	@State private var showSettings: Bool = false
	@State private var showAddAvatar: Bool = false
	@State private var isLoading: Bool = true

	private struct Constants {
		static let settingsButtonImage: String = "gear"
		static let settingButtonText: String = "Settings"
		static let sectionHeaderTitle: String = "My Avatars"
		static let addButtonText: String = "Settings"
		static let addButtonIcon: String = "plus.circle.fill"
	}

	var body: some View {
		NavigationStack {
			listContainer
				.navigationTitle("Profile")
				.toolbar {
					ToolbarItem(placement: .topBarTrailing) {
						settingsButton
					}
				}
		}
		.sheet(isPresented: $showSettings) {
			SettingsView()
				.environment(AppState())
		}
		.fullScreenCover(isPresented: $showAddAvatar) {
			Text("Add new avatar")
		}
		.task {
			await loadData()
		}
	}

	// MARK: - ProfileView Helpers
	private var settingsButton: some View {
		Image(systemName: Constants.settingsButtonImage)
			.font(.headline)
			.foregroundStyle(.accent)
			.anyButton {
				onSettingsButtonPressed()
			}
			.accessibilityIdentifier(Self.settingsButtonIdentifier)
	}

	private func loadData() async {
		try? await Task.sleep(for: .seconds(5))
		isLoading.toggle()
		myAvatars = AvatarModel.mocks
	}
}

// MARK: - ProfileView Business Logic
private extension ProfileView {
	func onSettingsButtonPressed() {
		showSettings.toggle()
	}

	func onAddAvatarPressed() {
		showAddAvatar.toggle()
	}

	func onDeleteAvatar(_ indexSet: IndexSet) {
		guard let index = indexSet.first else { return }
		myAvatars.remove(at: index)
	}
}

// MARK: - ProfileView Extension - Section Avatar List
private extension ProfileView {
	private var listContainer: some View {
		List {
			circleSection
			profileSection
		}
	}

	private var profileSection: some View {
		Section {
			profileSectionCell()
		} header: {
			sectionHeader
		}
	}

	@ViewBuilder
	func profileSectionCell() -> some View {
		if isLoading {
			ProfileAvatarsLoadingView()
				.loadingAnimation()
		} else if myAvatars.isEmpty {
			NoAvatarFoundView {
				onAddAvatarPressed()
			}
		} else {
			ForEach(myAvatars) { avatar in
				PopularCellView(
					title: avatar.name,
					subTitle: nil,
					imageName: avatar.profileImageName
				)
				.anyButton(.highlight) {
					print("Click on avatar: \(avatar.id)")
				}
				.listRowFormatting()
			}
			.onDelete { indexSet in
				onDeleteAvatar(indexSet)
			}
		}
	}

	private var sectionHeader: some View {
		HStack {
			AppTextView(text: Constants.sectionHeaderTitle)
			Spacer()
			iconButton
		}
	}

	private var iconButton: some View {
		Image(systemName: Constants.addButtonIcon)
			.foregroundStyle(.accent)
			.font(.title3)
			.anyButton {
				onAddAvatarPressed()
			}
			.accessibilityIdentifier(Self.addButtonIdentifier)
	}
}

// MARK: - ProfileView Extension - Profile Circle
private extension ProfileView {
	var circleSection: some View {
		Section {
			zStackContainer
				.listRowFormatting()
		}
	}

	var zStackContainer: some View {
		ZStack {
			circleView
		}
	}

	var circleView: some View {
		ProfileCircleColourView(currentUser: currentUser)
	}
}

// MARK: - ProfileView Accessibility Helpers
private extension ProfileView {
	static let settingsButtonIdentifier: String = "\(Constants.settingButtonText) Button"
	static let addButtonIdentifier: String = "\(Constants.addButtonText) Button"
}

#Preview {
	ProfileView()
}
