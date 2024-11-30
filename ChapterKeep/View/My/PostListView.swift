//
//  PostListView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/27/24.
//

import SwiftUI

struct PostListView: View {
    @Environment(\.presentationMode) var presentationMode
    var type: ListType
    @Binding var posts: [Post]

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("ChapterKeep")
                        .foregroundColor(.accent)
                        .font(.system(size: 15).bold())
                    Spacer()
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName:"xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(.trailing)
                    }
                }
                HStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text(type.rawValue)
                                .font(.system(size: 20).bold())
                                .foregroundColor(.accent)
                                .padding(.bottom, 8)
                            Text(type.rawValue + "을\n한번에 모아보세요")
                                .font(.system(size: 15).bold())
                                .lineSpacing(6)
                                .foregroundColor(Color(red: 0.40, green: 0.40, blue: 0.40))
                        }
                        .padding()
                        .padding(.vertical, 6)
                    }
                    Spacer()
                }
            }
            .padding([.top, .horizontal])
            LazyVStack {
                ForEach(posts) { post in
                    NavigationLink(destination: EmptyView()) {
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(post.title)
                                        .font(.system(size: 14).bold())
                                        .foregroundColor(.black)
                                    Text("\(post.date) / \(post.writer)")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color(red: 0.45, green: 0.42, blue: 0.42))
                                }
                                Spacer()
                                VStack {
                                    Menu {
                                        Button("삭제하기", action: { deletePost(post: post)})
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .rotationEffect(.degrees(90))
                                            .padding(4)
                                    }
                                    Spacer()
                                }
                            }
                            .padding()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 0.50)
                                .stroke(Color(red: 0.23, green: 0.49, blue: 0.17), lineWidth: 0.50)
                        )
                        .padding(.vertical, 6)
                    }
                }
                Spacer()
            }
            .padding()
            .scrollOnOverflow()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func deletePost(post: Post) {
        posts.removeAll(where: { $0.id == post.id })
    }
}

@available(iOS 17.0, *)
#Preview() {
    @Previewable @State var posts: [Post] = [
        Post(title: "집에 가고 싶다", date: "2024-11-26", writer: "책 먹는 고양이"),
        Post(title: "집에 가고 싶다", date: "2024-11-26", writer: "책 먹는 고양이"),
        Post(title: "집에 가고 싶다", date: "2024-11-26", writer: "책 먹는 고양이"),
    ]
    
    PostListView(type: .likes, posts: $posts)
}
