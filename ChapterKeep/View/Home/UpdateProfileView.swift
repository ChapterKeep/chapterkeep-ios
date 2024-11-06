//
//  UpdateProfileView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/30/24.
//

import SwiftUI

struct UpdateProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var model: ProfileModel

    var body: some View {
        ZStack {
            Color.accent.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("ChapterKeep")
                        .foregroundColor(.white)
                        .font(.system(size: 15).bold())
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("프로필 수정")
                            .foregroundColor(.accent)
                            .font(.system(size: 20).bold())
                        Spacer()
                        Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.accentColor)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    
                    ProfileEditView()
                        .environmentObject(model)
                    Spacer()
                    Button(action: {
                        updateProfile()
                    }) {
                        Text("수정하기")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(model.nicknameAvailability != .unavailable ? .accent : .gray.opacity(0.4))
                            .cornerRadius(8)
                    }
                    .disabled(model.nicknameAvailability == .unavailable)
                    .padding([.horizontal, .bottom], 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .cornerRadius(12)
            }
            .padding([.horizontal, .bottom])
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func updateProfile() {
        // TODO: 프로필 업데이트 구현
        // if success
        model.nicknameAvailability = .none
        self.presentationMode.wrappedValue.dismiss()
    }
}

@available(iOS 17.0, *)
#Preview() {
    @Previewable @StateObject var model = ProfileModel()
    
    UpdateProfileView()
        .environmentObject(model)
        .onAppear {
            model.nickname = "책 먹는 고양이"
            model.intro = "컴퓨터 전공 관련 교육책이나 추리 소설 좋아합니다 "
        }
}
