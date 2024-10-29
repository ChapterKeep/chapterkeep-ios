//
//  MainView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/29/24.
//

import SwiftUI

struct MainView: View {
    @Binding var state: AppState

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var state = AppState.main
    MainView(state: $state)
}
