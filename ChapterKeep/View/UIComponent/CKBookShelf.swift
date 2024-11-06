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
                        VStack {
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
