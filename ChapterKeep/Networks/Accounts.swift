//
//  Accounts.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/29/24.
//

import Papyrus
import SwiftUI

struct SignupData: Codable {
    let memberId: Int
}

struct LoginData: Codable {
    let message: String
}

@API
protocol Accounts {
    @GET("/check-id")
    func checkUsername(_ id: String) async throws -> APIResponse<Bool>
    
    @GET("/check-id")
    func checkNickname(_ nickname: String) async throws -> APIResponse<Bool>

    @Multipart
    @POST("/signup")
    func signup(info: Part, image: Part) async throws -> APIResponse<SignupData>
    
    @POST("/login")
    func login(id: String, password: String) async throws -> APIResponse<LoginData>
    
    @Authorization(.bearer("")) // TODO: need to fill from Keychain or UserDefaults
    @DELETE("/withdraw/:id")
    func deleteAccount(id: String) async throws -> APIResponse<String>
}
