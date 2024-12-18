//
//  CKButton.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/2/24.
//

import Foundation

import SwiftUI

@MainActor struct CKButton<Label: View>: View {

    let action: @MainActor () -> Void
    var color = Color.accent
    @ViewBuilder let label: () -> Label
    
    var body: some View {
        Button (action: action) {
            label()
        }
        .foregroundStyle(.white)
        .background(color)
        .cornerRadius(8)
    }

}

#Preview("Button Preview") {
    CKButton(action: { }) {
        Text("Resuable Button!")
    }
}
