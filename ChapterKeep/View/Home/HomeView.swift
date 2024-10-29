//
//  HomeView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/29/24.
//

import SwiftUI

struct HomeView: View {
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
                    CKButton (action: { model.isBookShelfVisible.toggle() }, color: .accentColorDark) {
                        HStack(spacing: 0) {
                            Image(systemName: model.isBookShelfVisible ? "lock.open" : "lock")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                                .padding(.horizontal, 7)
                            Text(model.isBookShelfVisible ? "책장 공개" : "책장 비공개")
                                .font(.system(size: 10).weight(.medium))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width:80 , height: 25, alignment: .center)
                    }
                }
                .padding(.bottom)
                profile
                Spacer()

            }
            .padding(20)
        }
    }
    
    private var profile: some View {
        HStack {
            VStack {
                model.profileImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(1)
                    .background(.white)
                    .clipShape(Circle())
                    .padding(3)
                    .background(.accent)
                    .clipShape(Circle())
                
                NavigationLink(destination: UpdateProfileView().environmentObject(model)) {
                    Text("프로필 수정")
                        .font(.system(size: 10).weight(.medium))
                        .foregroundColor(.white)
                        .frame(width:60, height: 25, alignment: .center)
                    
                }
                .foregroundStyle(.white)
                .background(.accent)
                .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .padding(.trailing, 20)
            VStack(alignment: .leading) {
                Text(model.nickname)
                    .font(.system(size: 19).weight(.bold))
                    .padding(.bottom, 2)
                Text(model.intro)
                    .font(.system(size: 12))
                    .padding(.bottom, 6)
                HStack {
                    Text("작성글 수")
                        .font(.system(size: 19).weight(.bold))
                        .padding(.trailing)
                    Text("\(model.articleCount)권")
                        .font(.system(size: 13))
                }
            }
            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(12)
        .padding(3)
        .background(.accentColorDark)
        .cornerRadius(12)
        .padding(5)
        .background(.white)
        .cornerRadius(12)
    }
}

@available(iOS 17.0, *)
#Preview() {
    @Previewable @StateObject var model = ProfileModel()
    
    HomeView()
        .environmentObject(model)
        .onAppear {
            model.nickname = "책 먹는 고양이"
            model.intro = "컴퓨터 전공 관련 교육책이나 추리 소설 좋아합니다 "
        }
}
