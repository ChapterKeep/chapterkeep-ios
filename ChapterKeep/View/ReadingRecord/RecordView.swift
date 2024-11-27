//
//  RecordView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/6/24.
//

import Foundation
import SwiftUI

struct RecordView: View {
    @State var rating = 3
    var book: CKBook
    @State var review: CKBookReview
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter
    }()

    var body: some View {
        VStack {
            HStack {
                Text("ChapterKeep")
                    .foregroundColor(.white)
                    .font(.system(size: 15).bold())
                Spacer()
            }
            .padding(.horizontal)
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: .infinity, height: .infinity)
                    .background(.white)
                    .padding()
                    .padding(.horizontal, 5)
                    .padding(.bottom, 60)
                    .offset(x: -10, y: 20)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 10, y: 4
                    )
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: .infinity, height: .infinity)
                    .background(.white)
                    .padding()
                    .padding(.horizontal, 5)
                    .padding(.bottom, 60)
                    .offset(x: 10, y: 35)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 10, y: 4
                    )
                Rectangle()
                    .foregroundColor(.clear)
                    .background {
                        VStack {
                            HStack {
                                Image(systemName: "book")
                                    .frame(width: 50, height: 80)
                                    .background(Color.gray.opacity(0.3))
                                VStack(alignment: .leading) {
                                    Text(book.title)
                                        .font(.system(size: 15).bold())
                                        .padding(.bottom, 2)
                                    Text(book.author)
                                        .font(.system(size: 13))
                                        .foregroundColor(.gray)
                                }
                                .padding(.leading)
                                Spacer()
                            }
                            .padding(.leading)
                            Divider()
                                .padding(5)
                            HStack {
                                Text(review.title)
                                Spacer()
                                Button(action: { }) {
                                    Image(systemName: "ellipsis")
                                        .rotationEffect(.degrees(90))
                                }
                            }
                            .padding(.horizontal)
                            HStack {
                                Text("작성 \(dateFormatter.string(from: review.createdAt))")
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                                Spacer()
                                CKStarRate(rating: $rating, starSize: 20, readOnly: true)
                            }
                            .padding(.horizontal)
                            HStack {
                                Rectangle()
                                    .frame(width: 4, height: 20)
                                    .foregroundColor(.black)
                                    .padding(.trailing, 5)
                                Text(review.quoatation)
                                        .font(.system(size: 15, weight: .light).italic())
                                        .foregroundColor(.gray)
                                Spacer()
                            }
                            .padding(.horizontal)
                            VStack (alignment: .leading) {
                                Text(review.content)
                            }
                            .padding()
                            .frame(width: .infinity)
                            .scrollOnOverflow()
                            Divider()
                                .padding(.horizontal, 5)
                            HStack {
                                Image(systemName: review.liked ? "heart.fill" : "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(review.liked ? .red : .black)
                                    .onTapGesture {
                                        tapLike()
                                    }
                                Text("\(review.like)")
                                    .font(.system(size: 13))
                                Spacer()
                                Text(review.writer)
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)
                            }
                            .padding()
                        }
                        .padding()
                    }
                    .background {
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "bookmark.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color(red: 240 / 255, green: 238 / 255, blue: 224 / 255))
                                    .padding(.trailing)
                            }
                            Spacer()
                        }
                    }
                    .frame(width: .infinity, height: .infinity)
                    .background(.white)
                    .padding()
                    .padding(.horizontal, 5)
                    .padding(.bottom, 60)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 10, y: 4
                    )
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.accentColorDark)
        .navigationBarBackButtonHidden(true)
        .background(Color(red: 0.26, green: 0.31, blue: 0.24))
    }
}

extension RecordView {
    func tapLike() {
        if review.liked {
            review.like -= 1
        } else {
            review.like += 1
        }
        review.liked.toggle()
        // TODO: 서버
    }
}

#Preview {
    RecordView(book: CKBook(bookId: -1, title: "1퍼센트 부자들의 법칙", author: "사이토 히토리"),
               review: CKBookReview(id: -1, bookId: -1, memberId: -1, rating: 3,
                                    title: "부자들 힘들게 사네",
                                    content: """
그들은 진정한 친구가 아니기 때문이다.
친구란 말하자면 또 하나의 자신이다.
친구를 보면 그 사람을 알 수 있다.
현명한 사람과 어리석은 사람은 서로 어울리지 않는다.
친구는 나를 동정하는 자가 아니라 나를 돕는 자다.
서로가 고통을 덜어 주지 않는다면 우리는 무엇을 위해 사는 것일까?
우리는 모두 적막한 세계를 떠도는 나그네다.
그 여정에서 찾을 수 있는 최고의 선물은 바로 믿음직한 벗이다.
""",
                                    quoatation: "life is short", writer: "책 먹는 고양이",
                                    createdAt: Date(), like: 50, liked: false))
}
