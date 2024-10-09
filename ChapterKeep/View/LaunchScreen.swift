//
//  LaunchScreen.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import SwiftUI

struct LaunchScreen: View {
    @State var title = ""
    @State var description = ""

    var body: some View {
        ZStack {
            Color(.accent)
            VStack {
                Image(systemName: "apple.logo") // TODO: 로고 이미지로 변경
                    .resizable()
                    .imageScale(.large)
                    .foregroundStyle(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                    .padding()
                Text(title)
                    .foregroundStyle(.white)
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .padding(.bottom, 6)
                Text(description)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .padding(.bottom)

            }
            .task {
                try? await Task.sleep(for: .seconds(0.3))
                withAnimation {
                    title = "ChapterKeep!"
                }
                try? await Task.sleep(for: .seconds(0.8))
                withAnimation {
                    description = "당신의 독서 여정을\n한 페이지씩 기록하세요.!"
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LaunchScreen()
}
