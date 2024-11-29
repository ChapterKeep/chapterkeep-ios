//
//  SignupView+Profile.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import SwiftUI

struct ProfileEditView: View {
    @EnvironmentObject var model: ProfileModel

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
                if model.nicknameAvailability == .available {
                    Text("사용 가능한 닉네임입니다.")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                } else if model.nicknameAvailability == .unavailable {
                    Text("사용할 수 없는 닉네임입니다.")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
                Spacer()
                CKButton (action: { checkDuplicateNickname() }) {
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
            
            Text("학과를 선택해주세요")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.gray)
            // TODO: 학과 선택 추가

        }
        .padding([.bottom, .horizontal], 30)
    }
    
    func regisiterImage() {
        // TODO: 프로필 이미지 등록 구현
//        model.profileImage = UIImage(systemName: "person.fill.turn.down")!
    }
    
    func checkDuplicateNickname() {
        // TODO: 닉네임 중복 확인 구현
        if model.nicknameAvailability == .available {
            model.nicknameAvailability = .unavailable
        } else {
            model.nicknameAvailability = .available
        }
    }
}

@available(iOS 17.0, *)
#Preview() {
    @Previewable @StateObject var model = ProfileModel()
    
    ProfileEditView()
        .environmentObject(model)
}
