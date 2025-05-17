//
//  SelectColorOnboardingView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

struct SelectColorOnboardingView: View {
	let availableColors: [AppColoursModel] = AppColoursModel.allCases
	@State private var selectedIndex: Int = 100
	@State private var selectedColour: Color = .blue
	@State private var isColourSelected: Bool = false
	@State private var isNavigating: Bool = false

	let columns: [GridItem] = [
		.init(.flexible(), spacing: 8, alignment: .center),
		.init(.flexible(), spacing: 8, alignment: .center),
		.init(.flexible(), spacing: 8, alignment: .center)
	]

	struct Constants {
		static let title: String = "Select a profile color"
		static let vGridPadding: CGFloat = 24
	}

    var body: some View {
		ScrollView {
			listOfColors
		}
		.navigationDestination(isPresented: $isNavigating) {
			FinalOnboardingView(colour: selectedColour)
				.transition(.move(edge: .trailing))
		}
		.scrollIndicators(.hidden)
		.animation(.smooth, value: selectedColour)
		.toolbar(.hidden, for: .navigationBar)

		presentButton()
			.padding()
    }

	// MARK: - View Helpers
	var listOfColors: some View {
		LazyVGrid(
			columns: columns,
			alignment: .center,
			spacing: 16,
			pinnedViews: [.sectionHeaders],
			content: ({
				Section {
					ForEach(availableColors.indices, id: \.description) { index in
						CircleColourView(
							isSelected: .constant(selectedIndex == index),
							colour: AppColoursModel.mapColorToBackground(availableColors[index]),
							index: index,
							onTap: ({ idx in
								selectedIndex = idx
								selectedColour = AppColoursModel.mapColorToBackground(availableColors[idx])
								isColourSelected = true
							})
						)
						.accessibilityIdentifier("\(Constants.title): \(availableColors[index].rawValue)")
					}
				} header: {
					AppTextView(
						text: Constants.title,
						font: .headline
					)
				}

			})
		)
		.padding(.horizontal, Constants.vGridPadding)
	}
}

// MARK: - SelectColorOnboardingView Business Logic
private extension SelectColorOnboardingView {
	@ViewBuilder
	func presentButton() -> some View {
		if isColourSelected {
			AppButton(
				title: "Continues",
				colour: .accent,
				onTap: ({
					isNavigating.toggle()
				})
			)
		} else {
			EmptyView()
		}
	}
}

#Preview {
	NavigationStack {
		SelectColorOnboardingView()
	}
	.environment(AppState())
}
