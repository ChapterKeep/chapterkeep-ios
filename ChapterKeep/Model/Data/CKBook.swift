//
//  CKBook.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/30/24.
//

import Foundation

struct CKBook: Codable, Identifiable, Hashable {
    var id: Int { bookId }
    
    var bookId: Int
    var title: String
    var author: String
}
