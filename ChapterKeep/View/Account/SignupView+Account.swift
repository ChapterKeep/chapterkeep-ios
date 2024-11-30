//
//  SignupView+Profile.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import Foundation
import RegexBuilder
import SwiftUI

struct SignupAccountView: View {
    enum UsernameState: String {
        case none
        case duplicate = "이미 사용된 아이디 입니다"
        case available = "사용 가능한 아이디 입니다"
    }

    enum PasswordState: String {
        case none
        case mismatch = "비밀번호가 일치하지 않습니다"
        case unsecure = "비밀번호는 (...)을 만족해야 합니다."
        case available
    }

    @EnvironmentObject var model: SignupModel
    @EnvironmentObject var networking: Networking
    private var api: Accounts { networking.member }

    @State var usernameState: UsernameState = .none
    @State var passwordState: PasswordState = .none

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("아이디를 입력해주세요")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.gray)
            
            CKTextFeild("아이디", text: $model.username, maxLength: 10)
                .padding(.bottom, 6)
            
            HStack {
                if usernameState != .none {
                    Text(usernameState.rawValue)
                        .font(.system(size: 13))
                        .foregroundColor(usernameState == .duplicate ? .red : .gray)
                }
                Spacer()
                CKButton (action: { Task { await checkUsernameAvailability() } }) {
                    Text("중복 확인")
                        .font(.system(size: 13).weight(.medium))
                        .foregroundColor(.white)
                        .frame(width:80, height: 30, alignment: .center)
                }
            }
            .padding(.bottom)
            
            Text("비밀번호를 입력해주세요")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.gray)
            CKTextFeild("비밀번호", text: $model.password, type: .secure, maxLength: 16)
                .onChange(of: model.password) { newValue in
                    checkPasswordAvailability(password: newValue)
                }
            CKTextFeild("비밀번호 확인", text: $model.passwordConfirm, type: .secure, maxLength: 16)
                .onChange(of: model.passwordConfirm) { newValue in
                    checkPasswordConfirm(password: model.password, confirm: newValue)
                }
            
            if passwordState == .unsecure || passwordState == .mismatch {
                Text(passwordState.rawValue)
                    .font(.system(size: 13))
                    .foregroundColor(.red)
            }
        }
        .padding([.bottom, .horizontal], 30)
        .onChange(of: usernameState) { state in
            if state == .available && passwordState == .available {
                model.isButtonEnabled = true
            }
        }
        .onChange(of: passwordState) { state in
            if state == .available && usernameState == .available {
                model.isButtonEnabled = true
            }
        }
    }
    
    func checkUsernameAvailability() async {
        if model.username.isEmpty {
            return
        }
        
        do {
            let response = try await api.checkUsername(model.username)
            if response.data! {
                usernameState = .duplicate
            } else {
                usernameState = .available
            }
        } catch {
            // TODO: Need error handling
            print(error)
        }
    }
    
    func checkPasswordAvailability(password: String) {
        let pattern = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,16}$"
        let regex = try! Regex(pattern)
        
        let range = NSRange(location: 0, length: password.utf16.count)
        if password.ranges(of: regex).isEmpty {
            passwordState = .unsecure
        } else {
            passwordState = .none
        }
    }
    
    func checkPasswordConfirm(password: String, confirm: String) {
        if passwordState == .none || passwordState == .mismatch {
            if password == confirm {
                passwordState = .available
            } else {
                passwordState = .mismatch
            }
        }
    }

}

#Preview {
    SignupAccountView()
            .environmentObject(SignupModel())
            .environmentObject(Networking())
}
