//
//  PostView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/27/24.
//

import SwiftUI

struct PostView: View {
    @Environment(\.presentationMode) var presentationMode

    var article: Article
    var board = ""
    var body: some View {
        VStack {
            // 해더
            HStack {
                Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName:"chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                Spacer()
            }
            .overlay(
                Text(board)
                    .font(.system(size: 20).bold())
            )
            .foregroundColor(.accentColor)
            .padding()
            // 글
            VStack(alignment: .leading) {
                HStack {
                    Text(article.title)
                        .font(.system(size: 18).bold())
                    Spacer()
                    Menu {
                        Button("수정하기", action: modifyPost)
                        Button("삭제하기", action: deletePost)
                    } label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(.degrees(90))
                    }
                }
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .padding(1)
                        .background(.white)
                        .clipShape(Circle())
                        .padding(3)
                        .background(.accent)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(article.writer)
                        Text(article.date)
                    }
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: 0.39, green: 0.42, blue: 0.47))
                    Spacer()
                }
                Text(article.content)
                    .font(.system(size: 16))
                    .padding(.vertical)
                HStack {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.pink)
                        .frame(width: 15, height: 15)
                    Text("\(article.likes)")
                        .foregroundColor(.pink)
                        .font(.system(size: 10))
                }
            }
            .padding()
            Divider()
            // 댓글
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }

    func modifyPost() { }
    func deletePost() { }
}

#Preview {
    PostView(article: Article(title: "떨어지는 잎", content: "바람이 스치자마자 나무에서 마지막 잎이 떨어졌다. 하늘을 유영하는 듯 천천히 내려오는 잎을 바라보며 나는 생각했다. 계절이 가고 있구나. 가지를 떠나고 나면 그 잎은 흙이 되고, 나무는 다시 혼자가 된다. 그러나 그 나무는 알까? 새봄이 오면 다시금 새잎을 틔울 수 있다는 걸. 가벼워진 가지는 이 겨울을 온전히 견디며 다시 꽃을 피울 준비를 하고 있다.", likes: 50, writer: "건붕이", date: "2024-11-24"), board: "백일장 게시판")
}
