////
////  SearchView+Record.swift
////  ChapterKeep
////
////  Created by 이승윤 on 11/13/24.
////
//
//import SwiftUI
//
//extension SearchView {
//    func bookRecordSearchResult(results: [Any]) -> some View {
//        VStack {
//            ForEach(reviewSearchResult, id: \.self) { review in
//                HStack {
//                    Image(systemName: "book")
//                        .frame(width: 50, height: 80)
//                        .background(.blue.opacity(0.3))
//                    VStack {
//                        Text(review.title)
//                            .font(.system(size: 16).weight(.bold))
//                            .padding(.bottom, 2)
//                        Text(review.writer)
//                            .font(.system(size: 15))
//                    }
//                    Spacer()
//                }
//                .padding()
//                .background(.white)
//                .cornerRadius(12)
//                .padding(3)
//                .background(.accent)
//                .cornerRadius(12)
//            }
//
//            Spacer()
//        }
//        .background(Color(red: 221/255, green: 221/255, blue: 221/255).opacity(0.7))
//        .scrollOnOverflow()
//    }
//}
