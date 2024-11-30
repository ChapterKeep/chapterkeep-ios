//
//  LoginView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import Foundation
import SwiftUI
import Papyrus

@MainActor struct LoginView: View {
    @EnvironmentObject var networking: Networking
    private var api: Accounts { networking.member }

    @Binding var state: AppState
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack() {
            Spacer()
                .frame(height: 140)
            Text("ChapterKeep")
                .foregroundStyle(.accent)
                .fontWeight(.black)
                .font(.title)
            Text("당신의 독서 여정을 한 페이지씩 기록하세요.")
                .foregroundStyle(.accent)
                .font(.subheadline)
                .padding(.bottom)
            VStack(alignment: .leading) {
                CKTextFeild("아이디", text: $username, maxLength: 10)
                    .padding(.bottom, 6)
                CKTextFeild("비밀번호", text: $password, type: .secure, maxLength: 16)
            }
            .frame(width: 300)
            .padding()
            Button {
                Task { await doLogin() }
            } label: {
                Text("로그인")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 50)
                    .foregroundColor(.black.opacity(0.7))
                    .background(Color(red:241/255, green:241/255, blue:241/255))
                    .cornerRadius(12)
            }


            Spacer()
            NavigationLink(destination: SignupView()) {
                Text("회원가입")
            }
        }
    }
    
    func doLogin() async {
        do {
            let response = try await api.login(id: username, password: password)
            if response.code == "S001" {
                state = .main
            } else {
                print("Error \(response.code)\n\(response.message)")
            }
        } catch {
            if let error = error as? PapyrusError {
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview("LoginView Preview") {
    @Previewable @State var state = AppState.login
    LoginView(state: $state)
}
