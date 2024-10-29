//
//  SignupModel.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/29/24.
//

import SwiftUI

class SignupModel: ObservableObject {
    @Published var page = 1
    @Published var isButtonEnabled = false

    @Published var username = ""
    @Published var password = ""
    @Published var passwordConfirm = ""

    @Published var profileModel = ProfileModel()
}
