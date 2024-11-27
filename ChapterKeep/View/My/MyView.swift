//
//  MyView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/27/24.
//

import SwiftUI

struct Post: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var date: String
    var writer: String
}

enum ListType: String {
    case posts = "내가 쓴 게시글"
    case likes = "좋아요 누른 게시글"
    case comments = "댓글 단 게시글"
}


struct MyView: View {
    var nickname = "책 먹는 고양이"
    @State var posts = [
        Post(title: "테스트 게시글 1", date: "2024-11-11", writer: "책 먹는 고양이"),
        Post(title: "테스트 게시글 2", date: "2024-11-18", writer: "책 먹는 고양이"),
        Post(title: "테스트 게시글 3", date: "2024-11-25", writer: "책 먹는 고양이"),
        Post(title: "테스트 게시글 4", date: "2024-11-27", writer: "책 먹는 고양이"),
    ]
    @State var likes = [
        Post(title: "테스트 게시글 5", date: "2024-11-21", writer: "책 먹는 고양이"),
        Post(title: "테스트 게시글 6", date: "2024-11-22", writer: "책 먹는 고양이"),
        Post(title: "테스트 게시글 7", date: "2024-11-27", writer: "책 먹는 고양이"),
    ]
    @State var comments = [Post]()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ChapterKeep")
                .foregroundColor(.accent)
                .font(.system(size: 15).bold())
            VStack {
                // 프로필
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 85, height: 85)
                        .clipShape(Circle())
                        .padding(1)
                        .background(.white)
                        .clipShape(Circle())
                        .padding(3)
                        .background(.accent)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 2) {
                            Text(nickname)
                                .foregroundColor(.accent)
                            Text("님")
                        }
                        .font(.system(size: 20).bold())
                        Text("작성글 수 : 8 권")
                            .font(.system(size: 15).bold())
                        HStack {
                            Button {} label: {
                                Text("로그아웃")
                            }
                            Text("|")
                            Button {} label: {
                                Text("회원탈퇴")
                            }
                        }
                        .font(.system(size: 12).weight(.heavy))
                        .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                    }
                    .padding()
                    .padding(.leading)
                }
                
                VStack {
                    // 게시글
                    postsListCardView(listType: .posts, posts: posts)
                    
                    // 좋아요
                    postsListCardView(listType: .likes, posts: likes)

                    // 댓글
                    postsListCardView(listType: .comments, posts: comments)
                    Spacer()
                }
                .scrollOnOverflow()
            }
        }
        .padding()
    }
}

extension MyView {
    func postsListCardView(listType: ListType, posts: [Post]) -> some View {
        VStack(alignment: .leading) {
            Text(listType.rawValue)
                .font(.system(size: 18).bold())
            VStack {
                if posts.isEmpty {
                    Text("아직 \(listType.rawValue)이 없어요...")
                        .foregroundColor(.gray)
                }
                else if posts.count < 4 {
                    ForEach(posts) { post in
                        NavigationLink(destination: EmptyView()) {
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
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 13, height: 13)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        }
                    }
                } else {
                    ForEach(posts.prefix(2)) { post in
                        NavigationLink(destination: EmptyView()) {
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
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 13, height: 13)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        }
                    }
                    Divider()
                        .background(.white)
                        .padding(.horizontal)
                    NavigationLink(destination: PostListView(type: listType, posts: $posts)) {
                        HStack {
                            Spacer()
                            Text("더보기 ›")
                                .font(.system(size: 15))
                            Spacer()
                        }
                        .padding(.top, 8)
                        .padding(4)
                        .foregroundColor(Color(red: 0.49, green: 0.49, blue: 0.49))
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(red: 0.23, green: 0.49, blue: 0.17).opacity(0.11))
            .cornerRadius(20)
        }
        .padding(.top)

    }
}

#Preview {
    MyView()
}
