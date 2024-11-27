//
//  CKBookReview.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/6/24.
//

import Foundation

struct CKBookReview: Codable, Hashable {
    var id: Int
    var bookId: Int
    var memberId: Int
    var rating: Int
    var title: String
    var content: String
    var quoatation: String
    var writer: String
    var createdAt: Date
    var like: Int
    var liked: Bool
}
