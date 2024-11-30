//
//  ChapterKeepApp.swift
//  ChapterKeep
//
//  Created by 이승윤 on 9/25/24.
//

import SwiftUI
import Papyrus

enum AppState {
    case loading, login, main
}

class Networking: ObservableObject {
    let provider = Provider(baseURL: "http://13.124.90.247:8080/")

    let member: Accounts
    
    init() {
        self.member = AccountsAPI(
            provider: provider
                .intercept { req, next in
                    let res = try await next(req)
                    // Intercept Authorization Header
                    if let auth = res.headers?["Authorization"] {
                        // TODO: Save at KeyChain
                    }
                    return res
                })
    }

}

@main
struct ChapterKeepApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @State var state: AppState = .loading
    @StateObject var model = ProfileModel()
    @StateObject var networking = Networking()
    
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
                        .environmentObject(networking)
                }
            } else {
                NavigationView {
                    MainView(state: $state)
                        .environmentObject(model)
                        .environmentObject(networking)
                }
            }
        }
    }
}
