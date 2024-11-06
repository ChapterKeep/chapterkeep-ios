//
//  CKBookShelf.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/30/24.
//

import SwiftUI

struct CKBookShelf: View {
    
    var books: [CKBook]
    private var items: [CKBook] {
        if books.count == 3 { return books }
        else {
            var books = self.books
            while books.count < 3 {
                books.append(CKBook(bookId: -1, title: "", author: ""))
            }
            return books
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                ForEach(items) { book in
                    if book.id != -1 {
                        NavigationLink(destination: RecordView(
                            book: CKBook(bookId: -1, title: "1퍼센트 부자들의 법칙", author: "사이토 히토리"),
                            review: CKBookReview(id: -1, bookId: -1, memberId: -1, rating: 3, title: "부자들 힘들게 사네",
                                                 content: """
                                                    그들은 진정한 친구가 아니기 때문이다.
                                                    친구란 말하자면 또 하나의 자신이다.
                                                    친구를 보면 그 사람을 알 수 있다.
                                                    현명한 사람과 어리석은 사람은 서로 어울리지 않는다.
                                                    친구는 나를 동정하는 자가 아니라 나를 돕는 자다.
                                                    서로가 고통을 덜어 주지 않는다면 우리는 무엇을 위해 사는 것일까?
                                                    우리는 모두 적막한 세계를 떠도는 나그네다.
                                                    그 여정에서 찾을 수 있는 최고의 선물은 바로 믿음직한 벗이다.
                                                    """,
                                                 quoatation: "life is short", writer: "책 먹는 고양이", createdAt: Date(),
                                                 like: 50, liked: false))) {
                            Image(systemName: "book")
                                .frame(width: 65, height: 100)
                                .background(.blue.opacity(0.3))
                                .offset(y: 5)
                                .overlay {
                                    Text(book.title)
                                        .font(.caption2)
                                        .offset(y: 30)
                                }
                        }
                    } else {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 65, height: 100)
                            .offset(y: 5)
                    }
                    Spacer()
                }
            }
            .frame(height: 125)
            .background(.white)
            .clipShape(.rect(cornerRadius: 12))
            .padding()
            Rectangle()
                .fill(Color.brown)
                .frame(height: 8)
                .offset(y: -32)
        }
    }
}

#Preview {
    CKBookShelf(books: [
        CKBook(bookId: 1, title: "테스트1", author: "테스트1"),
        CKBook(bookId: 1, title: "테스트2", author: "테스트2"),
//        CKBook(bookId: 1, title: "테스트3", author: "테스트3")
    ])
    .padding()
    .background(Color.accent.opacity(0.7))
}
