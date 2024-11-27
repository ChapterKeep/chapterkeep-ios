//
//  BoardView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/20/24.
//

import SwiftUI

struct Article: Hashable {
    var isAnnouncement = false
    var title: String
    var content: String = ""
    var likes = 0
    var writer: String
    var date = "2024-11-27"
}

struct BoardDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var articles: [Article] = [] // For test
    @State var searchText = ""
    var boardName: String

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("ChapterKeep")
                        .foregroundColor(.accent)
                        .font(.system(size: 15).bold())
                    Spacer()
                }
                HStack {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName:"chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                    Text(boardName)
                        .font(.system(size: 20).bold())
                    Spacer()
                    NavigationLink(destination: NewPostView(board: boardName, isEssay: true, essayTopic: "[이달의 주제] 가을")) {
                        Image(systemName:"square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
                .foregroundColor(.accentColor)
                .padding(.vertical)
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("게시판의 글을 검색해보세요", text: $searchText, axis: .vertical)
                    }
                    .padding(.horizontal)
                    .frame(height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.gray.opacity(0.4), lineWidth: 1)
                    )
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25),
                        radius: 10,
                        y: 4
                    )
                    .padding(.trailing)
                    CKButton(action: {}) {
                        Text("검색")
                            .frame(width: 54, height: 40)
                    }
                }
            }
            .padding(.vertical)
            .padding()
            VStack {
                VStack {
                    ForEach(articles, id: \.self) { article in
                        NavigationLink(destination: PostView(article: article, board: boardName)) {
                            articleRow(article)
                        }
                        .padding(.horizontal)
                        .foregroundColor(.black)
                    }
                }
            }.scrollOnOverflow()
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
    }
}

extension BoardDetailView {
    func articleRow(_ article: Article) -> some View {
        VStack(alignment: .leading) {
            if article.isAnnouncement {
                HStack {
                    Image(systemName: "bell")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 20)
                    Text(article.title)
                        .font(.system(size: 15).bold())
                }
            } else {
                Text(article.title)
                    .font(.system(size: 15))
            }
            HStack() {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.pink)
                    .frame(width: 15, height: 15)
                Text("\(article.likes)")
                    .foregroundColor(.pink)
                    .font(.system(size: 10))
                Text(article.writer)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
            }
            .padding(.vertical, 5)
            Divider()
        }
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    BoardDetailView(articles: [
        Article(isAnnouncement: true, title: "[이달의 주제] 가을", likes: 50, writer: "운영자"),
        Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
        Article(isAnnouncement: false, title: "작은 별", likes: 50, writer: "책 먹는 하마"),
        Article(isAnnouncement: false, title: "꽃잎 같은 기억", likes: 50, writer: "책 먹는 하마"),
        Article(isAnnouncement: false, title: "여름의 끝", likes: 50, writer: "책 먹는 하마"),
        Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
        Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
        Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
        Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
    ], boardName: "백일장 게시판")
}
