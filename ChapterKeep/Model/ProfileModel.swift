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
    @Published var intro = ""
    @Published var department: Department = .none
}
