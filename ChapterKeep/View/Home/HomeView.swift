//
//  HomeView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/29/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.accent.opacity(0.7)
            Text("Hello, HomeView!")
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HomeView()
}
