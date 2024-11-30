//
//  SignupView+Profile.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import SwiftUI

struct ProfileEditView: View {
    @EnvironmentObject var model: ProfileModel
    @EnvironmentObject var networking: Networking
    private var api: Accounts { networking.member }

    var body: some View {
        VStack(alignment: .leading) {
            Text("프로필 사진 (선택)")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.gray)
            HStack(alignment: .center) {
                Spacer()
                VStack(alignment: .center) {
                    Image(uiImage: model.profileImage ?? UIImage(systemName: "person.crop.circle")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.gray.opacity(0.5))
                        .clipShape(.circle)
                    Button (action: { regisiterImage() }) {
                        Text("이미지 등록")
                            .font(.system(size: 13).weight(.medium))
                            .foregroundColor(.gray.opacity(0.8))
                            .frame(width:80, height: 30, alignment: .center)
                    }
                    .foregroundStyle(.white)
                    .background(.gray.opacity(0.4))
                    .cornerRadius(8)

                }
                Spacer()
            }
            CKTextFeild("닉네임 (10자 제한)", text: $model.nickname, maxLength: 10)
                .padding(.bottom, 6)
            HStack {
                Text(model.nicknameAvailability.rawValue)
                    .font(.system(size: 13))
                    .foregroundColor(model.nicknameAvailability == .unavailable ? .red : .gray)
                Spacer()
                CKButton (action: { Task { await checkDuplicateNickname() } }) {
                    Text("중복 확인")
                        .font(.system(size: 13).weight(.medium))
                        .foregroundColor(.white)
                        .frame(width:80, height: 30, alignment: .center)
                }
            }
            .padding(.bottom, 30)
            Text("간단한 자기소개를 입력해주세요 (80자 제한)")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.gray)
            CKTextFeild("자기소개 입력", text: $model.intro, height: 130, maxLength: 80)
                .padding(.bottom, 6)
        }
        .padding([.bottom, .horizontal], 30)
    }
    
    func regisiterImage() {
        // TODO: 프로필 이미지 등록 구현
//        model.profileImage = UIImage(systemName: "person.fill.turn.down")!
    }
    
    func checkDuplicateNickname() async {
        if model.nickname.isEmpty { return }
        
        do {
            let response = try await api.checkUsername(model.nickname)
            if response.data! {
                model.nicknameAvailability = .unavailable
            } else {
                model.nicknameAvailability = .available
            }
        } catch {
            // TODO: Need error handling
            print(error)
        }
    }
}

#Preview {
    ProfileEditView()
        .environmentObject(ProfileModel())
}
