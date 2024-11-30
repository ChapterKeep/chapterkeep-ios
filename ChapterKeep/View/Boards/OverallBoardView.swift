//
//  OverallBoardView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/20/24.
//

import SwiftUI

struct OverallBoardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("ChapterKeep")
                    .foregroundColor(.accent)
                    .font(.system(size: 15).bold())
                Spacer()
            }
            Text("게시판")
                .foregroundColor(.accent)
                .font(.system(size: 20).bold())
                .padding(.vertical)
            VStack {
                HStack {
                    Image(systemName: "leaf")
                        .resizable()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: 20, height: 20)
                        .padding(.horizontal)
                    Text("장르별 게시판")
                        .font(.system(size: 15))
                    Spacer()
                }
                .padding([.horizontal, .top])
                HStack {
                    Image(systemName: "leaf")
                        .resizable()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: 20, height: 20)
                        .padding(.horizontal)
                    Text("한줄평 게시판")
                        .font(.system(size: 15))
                    Spacer()
                }
                .padding([.horizontal, .top])
                NavigationLink(destination: BoardDetailView(articles: [
                    Article(isAnnouncement: true, title: "[이달의 주제] 가을", likes: 50, writer: "운영자"),
                    Article(title: "떨어지는 잎", content: "바람이 스치자마자 나무에서 마지막 잎이 떨어졌다. 하늘을 유영하는 듯 천천히 내려오는 잎을 바라보며 나는 생각했다. 계절이 가고 있구나. 가지를 떠나고 나면 그 잎은 흙이 되고, 나무는 다시 혼자가 된다. 그러나 그 나무는 알까? 새봄이 오면 다시금 새잎을 틔울 수 있다는 걸. 가벼워진 가지는 이 겨울을 온전히 견디며 다시 꽃을 피울 준비를 하고 있다.", likes: 50, writer: "건붕이", date: "2024-11-24"),
                    Article(isAnnouncement: false, title: "작은 별", likes: 50, writer: "책 먹는 하마"),
                    Article(isAnnouncement: false, title: "꽃잎 같은 기억", likes: 50, writer: "책 먹는 하마"),
                    Article(isAnnouncement: false, title: "여름의 끝", likes: 50, writer: "책 먹는 하마"),
                    Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
                    Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
                    Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
                    Article(isAnnouncement: false, title: "떨어지는 잎", likes: 50, writer: "책 먹는 하마"),
                ],boardName: "백일장 게시판")) {
                    HStack {
                        Image(systemName: "leaf")
                            .resizable()
                            .scaleEffect(x: -1, y: 1)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal)
                        Text("백일장 게시판")
                            .font(.system(size: 15))
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .padding([.horizontal, .top])
                }
                HStack {
                    Image(systemName: "leaf")
                        .resizable()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: 20, height: 20)
                        .padding(.horizontal)
                    Text("자유 게시판")
                        .font(.system(size: 15))
                    Spacer()
                }
                .padding()
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray.opacity(0.4), lineWidth: 2)
            )
            .shadow(
                color: Color(red: 0, green: 0, blue: 0, opacity: 0.5),
                radius: 12,
                y: 4
            )
            Text("이달의 백일장")
                .foregroundColor(.accent)
                .font(.system(size: 20).bold())
                .padding(.vertical)
            HStack {
                ZStack() {
                    Image("backLight")
                        .frame(width: 110, height: 110)
                        .offset(x: -0.50, y: -31)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 68.71, height: 68.71)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/69x69"))
                            )
                            .cornerRadius(87)
                            .overlay(
                                RoundedRectangle(cornerRadius: 87)
                                    .inset(by: -2)
                                    .stroke(.white, lineWidth: 2)
                            )
                            .offset(x: -0, y: 0)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 80, height: 80)
                            .overlay(
                                Ellipse()
                                    .inset(by: 1.50)
                                    .stroke(Color(red: 0.27, green: 0.49, blue: 0.17), lineWidth: 1.50)
                            )
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: 80, height: 80)
                    .offset(x: -0.50, y: -31)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 135, height: 77)
                        .background(.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 0.50)
                                .stroke(Color(red: 0.67, green: 0.67, blue: 0.67), lineWidth: 0.50)
                        )
                        .offset(x: 0, y: 47.50)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                        )
                    HStack(spacing: 3) {
                        Text("")
                            .font(.system(size: 13))
                            .lineSpacing(19.50)
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 14, leading: 24, bottom: 14, trailing: 24))
                    .frame(width: 54, height: 40)
                    .background(Color(red: 0.27, green: 0.49, blue: 0.17))
                    .cornerRadius(20)
                    .offset(x: -1.50, y: 15)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 5, y: 5
                    )
                    Text("별 헤는 밤")
                        .font(Font.custom("Inter", size: 15))
                        .lineSpacing(24)
                        .foregroundColor(.black)
                        .offset(x: -1.50, y: 49)
                    Text("책 먹는 고양이")
                        .font(Font.custom("Inter", size: 10).weight(.medium))
                        .foregroundColor(Color(red: 0.40, green: 0.40, blue: 0.40))
                        .offset(x: 26, y: 70.50)
                    ZStack() {
                        HStack(spacing: 0) {
                            Image(systemName: "heart")
                                .resizable()
                                .bold()
                        }
                        .padding(
                            EdgeInsets(top: 1.50, leading: 0.77, bottom: 1.39, trailing: 0.77)
                        )
                        .frame(width: 12, height: 12)
                        .offset(x: -15.50, y: -1)
                        Text("100+")
                            .font(Font.custom("Inter", size: 8).weight(.medium))
                            .foregroundColor(.black)
                            .offset(x: 8, y: 0.50)
                    }
                    .frame(width: 43, height: 14)
                    .offset(x: -29, y: 72)
                }
                .frame(width: 135, height: 172)
                ZStack() {
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 51.53, height: 51.53)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/52x52"))
                            )
                            .cornerRadius(87)
                            .overlay(
                                RoundedRectangle(cornerRadius: 87)
                                    .inset(by: -2)
                                    .stroke(.white, lineWidth: 2)
                            )
                            .offset(x: -0, y: -0)
                        Ellipse()
                            .foregroundColor(.clear)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Ellipse()
                                    .inset(by: 1.50)
                                    .stroke(Color(red: 0.27, green: 0.49, blue: 0.17), lineWidth: 1.50)
                            )
                            .offset(x: 0, y: 0)
                    }
                    .frame(width: 60, height: 60)
                    .offset(x: 0, y: -33.50)
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 114, height: 64)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .inset(by: 0.50)
                                    .stroke(Color(red: 0.67, green: 0.67, blue: 0.67), lineWidth: 0.50)
                            )
                            .offset(x: 0, y: 0)
                            .shadow(
                                color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                            )
                        Text("세상은 요지경")
                            .font(Font.custom("Inter", size: 13))
                            .lineSpacing(24)
                            .foregroundColor(.black)
                            .offset(x: -1.27, y: -2.23)
                        Text("책 먹는 하마")
                            .font(Font.custom("Inter", size: 10).weight(.medium))
                            .foregroundColor(Color(red: 0.40, green: 0.40, blue: 0.40))
                            .offset(x: 21.96, y: 13.77)
                        ZStack() {
                            ZStack() {
                                Image(systemName: "heart")
                                    .resizable()
                                    .bold()
                            }
                            .frame(width: 10.13, height: 8.93)
                            .offset(x: -13.09, y: 0.63)
                            Text("80")
                                .font(Font.custom("Inter", size: 8).weight(.medium))
                                .foregroundColor(.black)
                                .offset(x: 6.76, y: -0.26)
                        }
                        .frame(width: 36.31, height: 10.19)
                        .offset(x: -24.49, y: 15.51)
                    }
                    .frame(width: 114, height: 64)
                    .offset(x: 0, y: 31.50)
                    HStack(spacing: 3) {
                        Text("")
                            .font(Font.custom("Inter", size: 10))
                            .lineSpacing(19.50)
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 14, leading: 24, bottom: 14, trailing: 24))
                    .frame(width: 47, height: 30)
                    .background(Color(red: 0.27, green: 0.49, blue: 0.17))
                    .cornerRadius(20)
                    .offset(x: -0.50, y: 0.50)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.05), radius: 5, y: 5
                    )
                }
                .frame(width: 114, height: 127)
                .padding()
            }
            .padding(.vertical)
            Text("오늘의 추천도서")
                .foregroundColor(.accent)
                .font(.system(size: 20).bold())
                .padding(.vertical)
            HStack {
                // TODO: replace mock-up with real recommand book
                Image(systemName: "book")
                    .frame(width: 65, height: 100)
                    .background(.blue.opacity(0.3))
                    .padding()
                VStack(alignment: .leading, spacing: 5) {
                    Text("오늘 하루도, 소심한 야옹이")
                        .font(Font.custom("Inter", size: 15))
                        .lineSpacing(24)
                        .foregroundColor(.black)
                    Text("이수민 | 재능 출판사")
                        .font(Font.custom("Inter", size: 10).weight(.medium))
                        .foregroundColor(Color(red: 0.40, green: 0.40, blue: 0.40))
                    Text("에세이")
                        .font(Font.custom("Inter", size: 10).weight(.medium))
                        .foregroundColor(Color(red: 0.40, green: 0.40, blue: 0.40))
                    Text("오늘 하루도 소심한 야옹이는 용기를 냅니다. 앞으로도 소심하게 살 수는 없으 ..")
                        .font(Font.custom("Inter", size: 10).weight(.medium))
                        .foregroundColor(Color(red: 0.67, green: 0.67, blue: 0.67))

                }
                Spacer()
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray.opacity(0.4), lineWidth: 2)
            )
            .shadow(
                color: Color(red: 0, green: 0, blue: 0, opacity: 0.5),
                radius: 12,
                y: 4
            )
            Spacer()
        }
        .padding()
        .scrollOnOverflow()
    }
}

#Preview {
    OverallBoardView()
}
