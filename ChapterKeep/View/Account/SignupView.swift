//
//  SignupView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import Foundation
import SwiftUI

struct SignupView: View {
    
    @State private var page = 1
    @State private var isButtonEnabled = false
    @ObservedObject private var model = SignupModel()
    
    var body: some View {
        VStack {
            SignupHeader()
            Spacer()
            VStack {
                Button(action: { }) {
                    Text(page == 1 ? "다음으로" : "가입하기")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isButtonEnabled ? .accent : .gray.opacity(0.4))
                        .cornerRadius(8)
                }
                .disabled(!isButtonEnabled)
            }
            .padding(20)

        }
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
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    SignupView()
}
