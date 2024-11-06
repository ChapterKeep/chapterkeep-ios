//
//  AddRecordView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/6/24.
//

import SwiftUI

struct AddRecordView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var bookImage: Image? = nil
    @State var isbn = ""
    @State var bookTitle = "책 제목"
    @State var writer = "글쓴이"
    @State var rating = 0
    @State var title = ""
    @State var quotation = ""
    @State var post = ""
    
    @State var showAlert = false

    var body: some View {
        VStack {
            HStack {
                Text("ChapterKeep")
                    .foregroundColor(.accent)
                    .font(.system(size: 15).bold())
                Spacer()
            }
            VStack(spacing: 20) {
                HStack {
                    Text("책 선택")
                        .font(.system(size: 16))
                    Spacer()
                    Text("[ISBN 조회하기](https://naver.com)")
                        .font(.system(size: 10))
                        .underline()
                        .padding(.trailing)
                }
                HStack {
                    if let image = bookImage {
                        image
                            .frame(width: 63, height: 100)
                            .background(.gray.opacity(0.05))
                            .padding(.trailing, 20)
                    } else {
                        Image(systemName: "plus")
                            .frame(width: 63, height: 100)
                            .background(.gray.opacity(0.3))
                            .onTapGesture {
                                // TODO: 이미지 선택 구현
                                bookImage = Image(systemName: "book")
                            }
                            .padding(.trailing, 20)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            TextField("ISBN 입력", text: $isbn, axis: .vertical)
                                .font(.system(size: 12))
                                .frame(width: 96, height: 15)
                                .frame(width: 120, height: 30)
                                .background(Color(red: 241/255, green: 242/255, blue: 243/255))
                                .cornerRadius(12)
                                .padding(.trailing)
                                .onChange(of: isbn) { newValue in
                                    if newValue.count > 13 {
                                        isbn = String(newValue.prefix(13))
                                    }
                                }

                            CKButton(action: { loadDataFromISBN() }) {
                                Text("확인")
                                    .frame(width: 54, height: 30)
                            }
                        }
                        Text(bookTitle)
                            .font(.system(size: 15).bold())
                            .padding(.top, 10)
                        Text(writer)
                            .font(.system(size: 12))
                            .padding(.top, 10)
                        Spacer()
                    }
                    .frame(height: 100)
                    .padding(.leading)
                }
                HStack {
                    Text("별점")
                    Spacer()
                }
                CKStarRate(rating: $rating)
                HStack {
                    Text("제목")
                    Spacer()
                }
                CKTextFeild("", text: $title, maxLength: 20)
                    .background(.gray.opacity(0.11))
                    .cornerRadius(12)
                HStack {
                    Text("인용 문구")
                    Spacer()
                }
                CKTextFeild("", text: $quotation, maxLength: 20)
                    .background(.gray.opacity(0.11))
                    .cornerRadius(12)
                HStack {
                    Text("상세 내용")
                    Spacer()
                }
                CKTextFeild("", text: $post, height: 130, maxLength: 1000)
                    .background(.gray.opacity(0.11))
                    .cornerRadius(12)
                HStack {
                    Text("\(post.count)/1000")
                        .font(.system(size: 12))
                        .foregroundColor(post.count == 1000 ? .red : .black)
                    Spacer()
                }
                CKButton (action: { addRecord() }, color: .accent) {
                    Text("등록하기")
                        .frame(width: 295, height: 45)
                }

            }
            .padding()
            .scrollOnOverflow()
        }
        .padding([.horizontal, .bottom])
        .edgesIgnoringSafeArea(.bottom)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("올바르지 않은 ISBN입니다."))
        })
        .navigationBarBackButtonHidden(true)
    }
}

extension AddRecordView {
    func loadDataFromISBN() {
        guard let _isbn = Int(self.isbn) else {
            showAlert = true
            return
        }
        if self.isbn.count != 13 {
            showAlert = true
        }
        // TODO: ISBN으로 정보 불러오기
    }

    func addRecord() {
        // TODO: 서버에 등록 구현
        self.presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddRecordView()
}
