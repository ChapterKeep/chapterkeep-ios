//
//  ChapterKeepApp.swift
//  ChapterKeep
//
//  Created by 이승윤 on 9/25/24.
//

import SwiftUI

enum AppState {
    case loading, login, main
}

@main
struct ChapterKeepApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @State var state: AppState = .loading
    @StateObject var model = ProfileModel()
    
    var body: some Scene {
        WindowGroup {
            if state == .loading {
                LaunchScreen()
                    .task {
                        try? await Task.sleep(for: .seconds(2))
                        if isLoggedIn {
                            state = .main
                        } else {
                            state = .login
                        }
                    }
            } else if state == .login {
                NavigationView {
                    LoginView(state: $state)
                }
            } else {
                NavigationView {
                    MainView(state: $state)
                        .environmentObject(model)

                }
            }
        }
    }
}
