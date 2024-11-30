//
//  SignupView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import Foundation
import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var model = SignupModel()
    @State private var isLoading = false
    @EnvironmentObject var networking: Networking
    private var api: Accounts { networking.member }

    var body: some View {
        VStack {
            SignupHeader()
                .padding(.bottom)
            VStack(alignment: .leading) {
                if model.page == 1 {
                    SignupAccountView()
                        .environmentObject(model)
                        .scrollOnOverflow()
                } else {
                    ProfileEditView()
                        .environmentObject(model.profileModel)
                        .scrollOnOverflow()
                }
            }
            Spacer()
            Button(action: {
                if model.page < 2 {
                    withAnimation { model.page += 1 }
//                    model.isButtonEnabled = false
                }
                else {
                    isLoading = true
                    Task {
                        if await signup() {
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            // TODO: Error alert
                        }
                        isLoading = false
                    }
                }
            }) {
                Text(model.page == 1 ? "다음으로" : "가입하기")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(model.isButtonEnabled ? .accent : .gray.opacity(0.4))
                    .cornerRadius(8)
            }
//            .disabled(!model.isButtonEnabled)
            .padding([.horizontal, .bottom], 20)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
    }
                       
    func signup() async -> Bool {
        let boundary = UUID().uuidString
        let url = URL(string: "http://13.124.90.247:8080/signup")!
        let info: [String: Any] = [
            "id": model.username,
            "password": model.password,
            "nickname": model.profileModel.nickname,
            "introduction": model.profileModel.intro
        ]
        
        guard let jsonInfo = try? JSONSerialization.data(withJSONObject: info, options: []) else {
            print("Failed to serialize JSON")
            return false
        }
        
        // Request Body
        var body = Data()

        body += Data("--\(boundary)\r\n".utf8)
        body += Data("Content-Disposition:form-data; name=\"info\"\r\n".utf8)
        body += Data("Content-Type: application/json\r\n\r\n".utf8)
        body += jsonInfo
        body += Data("\r\n".utf8)

        if let image = model.profileModel.profileImage?.pngData() {
            body += Data("--\(boundary)\r\n".utf8)
            body += Data("Content-Disposition:form-data; name=\"profileImage\"\r\n".utf8)
            body += Data("Content-Type: file; filename=\"profile.png\"\r\n".utf8)
            body += Data("Content-Type: image/png\r\n\r\n".utf8)
            body += image
            body += Data("\r\n".utf8)
        }
        body += Data("--\(boundary)--\r\n".utf8)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.httpBody = body

        print("\(body)")
        
        struct DataResponse: Codable { let memberId: Int }
        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Failed response: \(response)")
                return false
            }

            // Decode and handle the response if needed
            let responseData = try JSONDecoder().decode(APIResponse<DataResponse>.self, from: data)
            if responseData.code == "S001" {
                print(responseData)
                return true
            } else {
                print("Failed response: \(responseData)")
            }
        } catch {
            print("Error: \(error)")
        }
        return false
    }
}

struct SignupHeader: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets

    var body: some View {
        VStack {
            Spacer()
                .frame(height: safeAreaInsets.top)
            Text("ChapterKeep")
                .font(.system(size: 30, weight: .black))
                .foregroundColor(.white)
                .padding(.bottom, 2)
            Text("당신의 독서 여정을 한 페이지씩 기록하세요.")
                .font(.system(size: 15))
                .foregroundColor(.white)
            Spacer().frame(height: 13)
            Divider()
                .frame(height: 4)
                .background(Color.white)
            Spacer().frame(height: 13)
        }
        .frame(height: 160)
        .background(.accent)
        .padding(.bottom, 7)
    }
}

#Preview {
    SignupView()
        .environmentObject(Networking())
}
