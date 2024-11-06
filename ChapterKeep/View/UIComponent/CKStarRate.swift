//
//  CKStarRate.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/6/24.
//

import SwiftUI

struct CKStarRate: View {
    @Binding var rating: Int
    var starSize: CGFloat = 44
    var readOnly = false

    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < rating ? "star.fill" : "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: starSize, height: starSize)
                    .foregroundColor(index < rating ? .yellow : .gray)
                    .onTapGesture {
                        if !readOnly {
                            rating = index + 1
                        }
                    }
            }
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var rating = 1
    CKStarRate(rating: $rating)
}
