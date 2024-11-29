//
//  ProfileModel.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/29/24.
//

import SwiftUI

class ProfileModel: ObservableObject {
    @Published var profileImage: UIImage?
    @Published var nickname = ""
    @Published var nicknameAvailability: NicknameAvailablity = .none
    @Published var intro = ""
    
    @Published var articleCount = 0
    @Published var books = [
        CKBook(bookId: 1, title: "테스트1", author: "테스트"),
        CKBook(bookId: 2, title: "테스트2", author: "테스트"),
        CKBook(bookId: 3, title: "테스트3", author: "테스트"),
        CKBook(bookId: 4, title: "테스트4", author: "테스트"),
        CKBook(bookId: 5, title: "테스트5", author: "테스트"),
        CKBook(bookId: 6, title: "테스트6", author: "테스트"),
        CKBook(bookId: 7, title: "테스트7", author: "테스트"),
        CKBook(bookId: 8, title: "테스트8", author: "테스트"),

    ]
    @Published var isBookShelfVisible = false
}

extension ProfileModel {
    enum NicknameAvailablity {
        case none, available, unavailable
    }
}
