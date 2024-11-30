//
//  APIResponse.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/29/24.
//

struct APIResponse<T>: Codable where T: Codable {
    let code: String
    let message: String
    let data: T?
}
