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
    private var maxLength: Int
    
    @Binding private var text: String
    @ViewBuilder private var content: some View {
        if type == .normal {
            TextField(titleKey, text: $text, axis: .vertical)
                .autocapitalization(.none)
        } else if type == .secure {
            SecureField(titleKey, text: $text)
        }
    }

    init(_ titleKey: String, text: Binding<String>, type: CKTextFeildType = .normal, height: CGFloat = 50, maxLength: Int) {
        self.titleKey = titleKey
        self._text = text
        self.type = type
        self.height = height
        self.maxLength = maxLength
    }
    
    var body: some View {
        content
            .lineLimit(maxLength > 20 ? 5 : 1)
            .padding()
            .frame(minHeight: height, alignment: .top)
            .textFieldStyle(.plain)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray.opacity(0.4), lineWidth: 1)
            )
            .onChange(of: text) { newValue in
                if newValue.count > maxLength {
                    text = String(newValue.prefix(maxLength))
                }
            }
    }
}

@available(iOS 17.0, *)
#Preview("Normal Text Field") {
    @Previewable @State var text1 = ""
    @Previewable @State var text2 = ""
    CKTextFeild("테스트", text: $text1, maxLength: 10)
        .padding()
    CKTextFeild("테스트", text: $text2, height: 200, maxLength: 80)
        .padding()
}

@available(iOS 17.0, *)
#Preview("Secure Text Field") {
    @Previewable @State var text = ""
    CKTextFeild("비밀번호", text: $text, type: .secure, maxLength: 16)
}
