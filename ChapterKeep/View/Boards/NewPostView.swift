//
//  NewArticle.swift
//  ChapterKeep
//
//  Created by 이승윤 on 11/27/24.
//

import SwiftUI

struct RightAngledTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start at the bottom-left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        // Draw a line to the top-left corner
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        // Draw a line to the bottom-right corner
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        // Close the triangle
        path.closeSubpath()
        
        return path    }
}


struct NewPostView: View {
    @Environment(\.presentationMode) var presentationMode

    var board = ""
    var isEssay = false
    var essayTopic = ""
    var maxLength = 500
    var image = false
    
    @State var title = ""
    @State var content = ""
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    RightAngledTriangle()
                        .fill(Color(red: 0.26, green: 0.31, blue: 0.24))
                        .frame(width: 240, height: 240)
                        .overlay {
                            Rectangle()
                                .fill(.white)
                                .frame(width: 360, height: 4)
                                .rotationEffect(.degrees(45))
                                .offset(x: -25, y: 0)
                        }
                    Spacer()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("ChapterKeep")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 15).bold())
                    Spacer()
                }
                .padding(.bottom, 30)
                HStack {
                    Text(board)
                        .foregroundColor(.accentColor)
                        .font(.system(size: 20).bold())
                        .padding(.bottom, 2)
                    Spacer()
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 13, height: 13)
                            .foregroundColor(.black)
                    }
                }
                .padding(.bottom, 8)
                if isEssay {
                    Text(essayTopic)
                        .font(.system(size: 13).bold())
                }
                Text("제목")
                    .font(.system(size: 13).bold())
                    .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                    .padding(.vertical)
                CKTextFeild("제목을 입력하세요", text: $title, maxLength: 30)
                Text("내용 (최대 \(maxLength)자)")
                    .font(.system(size: 13).bold())
                    .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                    .padding(.vertical)
                CKTextFeild("내용을 입력하세요", text: $content, height: 200, maxLength: maxLength)
                Spacer()
                HStack {
                    Spacer()
                    CKButton(action: { presentationMode.wrappedValue.dismiss() }) {
                        Text("등록하기")
                            .frame(width: 295, height: 45)
                    }
                    Spacer()
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NewPostView(board: "백일장 작성하기", isEssay: true, essayTopic: "[이달의 주제] 가을")
}
