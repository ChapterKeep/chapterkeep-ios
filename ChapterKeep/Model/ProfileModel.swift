//
//  ProfileModel.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/29/24.
//

import SwiftUI

class ProfileModel: ObservableObject {
    @Published var profileImage = Image(systemName: "person.circle.fill")
    @Published var nickname = ""
    @Published var nicknameAvailability: NicknameAvailablity = .none
    @Published var intro = ""
    @Published var department: Department = .none
    
    @Published var articleCount = 0
    @Published var isBookShelfVisible = false
}

extension ProfileModel {
    enum NicknameAvailablity {
        case none, available, unavailable
    }
}
