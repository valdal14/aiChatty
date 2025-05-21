//
//  CircleColourView.swift
//  AIChatty
//
//  Created by Valerio D'ALESSIO on 2/5/25.
//

import SwiftUI

struct CircleColourView: View {
	@Binding var isSelected: Bool
	let colour: Color
	let index: Int
	let onTap: (Int) -> Void

    var body: some View {
		buttonView
    }

	var buttonView: some View {
		Button {
			onCircleButtonPressed()
			onTap(index)
		} label: {
			circleView
		}
	}

	var circleView: some View {
		Circle()
			.fill(colour)
			.frame(maxWidth: .infinity)
			.padding()
			.overlay {
				Circle()
					.stroke(.accent, lineWidth: 12)
					.opacity(isSelected ? 1 : 0)
					.frame(maxWidth: .infinity)
					.padding()
			}
	}
}

private extension CircleColourView {
	func onCircleButtonPressed() {
		isSelected.toggle()
	}
}

#Preview {
	CircleColourView(
		isSelected: .constant(false),
		colour: .blue,
		index: 0,
		onTap: ({ _ in })
	)
}
