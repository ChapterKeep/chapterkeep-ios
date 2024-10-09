//
//  ChapterKeepApp.swift
//  ChapterKeep
//
//  Created by 이승윤 on 9/25/24.
//

import SwiftUI

enum AppState {
    case loading, done
}

@main
struct ChapterKeepApp: App {
    @State var loadingState: AppState = .loading
    var body: some Scene {
        WindowGroup {
            if loadingState == .loading {
                LaunchScreen()
                    .task {
                        try? await Task.sleep(for: .seconds(2))
                        loadingState = .done
                    }
            } else {
                LoginView()
            }
        }
    }
}
