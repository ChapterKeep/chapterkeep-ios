////
////  SearchView+Bookshelf.swift
////  ChapterKeep
////
////  Created by 이승윤 on 11/13/24.
////
//import SwiftUI
//
//extension SearchView {
//    var bookShelfSearchResult: some View {
//        VStack {
//            ForEach(shelfSearchResult, id: \.self) { ckuser in
//                HStack {
//                    Image(systemName: ckuser.profileImage) // TODO: 실제 유저 이미지 받아오도록
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                        .clipShape(Circle())
//                        .padding(1)
//                        .background(.white)
//                        .clipShape(Circle())
//                        .padding(3)
//                        .background(.accent)
//                        .clipShape(Circle())
//                    VStack {
//                        Text(ckuser.name)
//                            .font(.system(size: 15).weight(.bold))
//                            .padding(.bottom, 2)
//                        HStack {
//                            Text("작성글 수")
//                                .font(.system(size: 11).weight(.bold))
//                                .padding(.trailing)
//                            Text("\(ckuser.count)권")
//                                .font(.system(size: 11))
//                        }
//                    }
//                }
//                .padding()
//                .background(.white)
//                .cornerRadius(12)
//                .padding(3)
//                .background(.accentColorDark)
//                .cornerRadius(12)
//                .padding(5)
//                .background(.white)
//                .cornerRadius(12)
//                
//                Spacer()
//            }
//
//            Spacer()
//        }
//        .background(Color(red: 221/255, green: 221/255, blue: 221/255).opacity(0.7))
//        .scrollOnOverflow()
//    }
//}
