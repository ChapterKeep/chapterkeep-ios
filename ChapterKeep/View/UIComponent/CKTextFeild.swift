//
//  CKTextFeild.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/9/24.
//

import Foundation
import SwiftUI

enum CKTextFeildType {
    case normal, secure
}

struct CKTextFeild: View {
    private var type: CKTextFeildType
    private var titleKey: String
    private var height: CGFloat
    @Binding private var text: String
    @ViewBuilder private var content: some View {
        if type == .normal {
            TextField(titleKey, text: $text)
        } else if type == .secure {
            SecureField(titleKey, text: $text)
        }
    }

    init(_ titleKey: String, text: Binding<String>, type: CKTextFeildType = .normal, height: CGFloat = 50) {
        self.titleKey = titleKey
        self._text = text
        self.type = type
        self.height = height
    }
    
    var body: some View {
        content
            .padding()
            .frame(minHeight: height, alignment: .top)
            .textFieldStyle(.plain)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray.opacity(0.4), lineWidth: 1)
            )
    }
}

@available(iOS 17.0, *)
#Preview("Normal Text Field") {
    @Previewable @State var text = ""
    CKTextFeild("테스트", text: $text)
        .padding()
    CKTextFeild("테스트", text: $text, height: 200)
        .padding()
}

@available(iOS 17.0, *)
#Preview("Secure Text Field") {
    @Previewable @State var text = ""
    CKTextFeild("비밀번호", text: $text, type: .secure)
}
