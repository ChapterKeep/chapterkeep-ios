//
//  SearchView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/13/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @State var selectedTab = 0
    @State var reviewSearchResult: [CKBookReview] = [
        CKBookReview(id: 0, bookId: 0, memberId: 0, rating: 0, title: "별들이 겹치는 순간은 화려하다", content: "", quoatation: "", writer: "책 먹는 고양이", createdAt: Date(), like: 1, liked: false),
        CKBookReview(id: 0, bookId: 0, memberId: 0, rating: 0, title: "별들이 겹치는 순간은 화려하다", content: "", quoatation: "", writer: "책 먹는 고양이", createdAt: Date(), like: 1, liked: false),
        CKBookReview(id: 0, bookId: 0, memberId: 0, rating: 0, title: "별들이 겹치는 순간은 화려하다", content: "", quoatation: "", writer: "책 먹는 고양이", createdAt: Date(), like: 1, liked: false),
        CKBookReview(id: 0, bookId: 0, memberId: 0, rating: 0, title: "별들이 겹치는 순간은 화려하다", content: "", quoatation: "", writer: "책 먹는 고양이", createdAt: Date(), like: 1, liked: false),
    ]
    @State var shelfSearchResult: [CKUser] = [
        CKUser(id: 0, name: "책 먹는 고양이1", articleCount: 8, profileImage: "person.circle.fill"),
        CKUser(id: 0, name: "책 먹는 고양이2", articleCount: 8, profileImage: "person.circle"),
        CKUser(id: 0, name: "책 먹는 고양이3", articleCount: 8, profileImage: "person.circle.fill"),
        CKUser(id: 0, name: "책 먹는 고양이4", articleCount: 8, profileImage: "person.circle"),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Text("ChapterKeep")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 15).bold())
                    Spacer()
                }
                .padding(.bottom, 30)
                VStack(alignment: .leading) {
                    Text("무엇을 찾고 계신가요?")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 20).bold())
                        .padding(.bottom, 2)
                    Text("찾고 싶은 독서기록이나 책장을\n검색해보세요")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }
                HStack {
                    CKTextFeild(selectedTab == 0 ? "책 제목을 검색해주세요" : "닉네임을 입력해주세요", text: $searchText, maxLength: 30)
                    CKButton(action: {}) {
                        Text("검색")
                            .frame(width: 54, height: 40)
                    }
                }
                .padding(.vertical)
                HStack {
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding([.top, .horizontal])
            .background(.white)
            // Search Result
            VStack {
                VStack {
                    if selectedTab == 0 {
                        ForEach(reviewSearchResult, id: \.self) { review in
                            reviewSearchItem(review: review)
                        }
                    } else {
                        ForEach(shelfSearchResult, id: \.self) { ckuser in
                            shelfSearchItem(ckuser: ckuser)
                        }
                    }
                }
                .padding(.vertical)
                Spacer()
            }
            .scrollOnOverflow()

        }
        .background(Color(red: 221/255, green: 221/255, blue: 221/255).opacity(0.7))
    }
    
    func shelfSearchItem(ckuser: CKUser) -> some View {
        HStack {
            Image(systemName: ckuser.profileImage) // TODO: 실제 유저 이미지 받아오도록
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
            VStack(alignment: .leading) {
                Text(ckuser.name)
                    .font(.system(size: 15).weight(.bold))
                    .padding(.bottom, 2)
                HStack {
                    Text("작성글 수")
                        .font(.system(size: 11).weight(.bold))
                        .padding(.trailing)
                    Text("\(ckuser.articleCount)권")
                        .font(.system(size: 11))
                }
            }
            .padding(.leading)
            Spacer()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.accent, lineWidth: 3)
        )
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    func reviewSearchItem(review: CKBookReview) -> some View {
        HStack {
            Image(systemName: "book")
                .frame(width: 50, height: 80)
                .background(.blue.opacity(0.3))
            VStack(alignment: .leading) {
                Text(review.title)
                    .font(.system(size: 16).weight(.bold))
                    .padding(.bottom, 2)
                Text(review.writer)
                    .font(.system(size: 15))
            }
            Spacer()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.accent, lineWidth: 3)
        )
        .padding(.horizontal)
        .padding(.vertical, 4)
    }

}

extension SearchView {
    enum TabbedItems: Int, CaseIterable {
        case bookRecord = 0
        case bookShelf
        
        var title: String {
            switch self {
            case .bookRecord:
                return "독서기록"
            case .bookShelf:
                return "책장"
            }
        }
    }

    func CustomTabItem(title: String, isActive: Bool) -> some View {
        Text(title)
            .font(.system(size: 16))
            .foregroundColor(isActive ? .accent : .gray)
            .padding()
            .frame(height: 52)
            .overlay(Rectangle().frame(width: nil, height: 3).foregroundColor(isActive ? .black : .clear), alignment: .bottom)
    }
}

#Preview {
    SearchView()
}
