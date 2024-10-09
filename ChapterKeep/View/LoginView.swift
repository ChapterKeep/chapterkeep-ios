//
//  LoginView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import Foundation
import SwiftUI

@MainActor struct LoginView: View {
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
                TextField("아이디", text: $username)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal)
                    .frame(width: 300, height: 50)
                    .textFieldStyle(.plain)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray.opacity(0.4), lineWidth: 1)
                    )
                    .padding(.bottom, 6)
                SecureField("비밀번호", text: $password)
                    .padding(.horizontal)
                    .frame(width: 300, height: 50)
                    .textFieldStyle(.plain)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray.opacity(0.4), lineWidth: 1)
                    )

            }
            .padding()
            Button {
               // Do login
            } label: {
                Text("로그인")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 300, height: 50)
                    .foregroundColor(.black.opacity(0.7))
                    .background(Color(red:241/255, green:241/255, blue:241/255))
                    .cornerRadius(12)
            }
//            .disabled(true)
//            .opacity(adminVM.isInputValid() ? 1.0 : 0.5)


            Spacer()
            Text("회원가입")
        }
    }
}

#Preview("LoginView Preview") {
    LoginView()
}
