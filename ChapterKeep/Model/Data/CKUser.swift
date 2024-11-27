//
//  CKUser.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/13/24.
//

struct CKUser: Codable, Hashable {
    var id: Int
    var name: String
    var articleCount: Int
    var profileImage: String
}
