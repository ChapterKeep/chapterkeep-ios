//
//  MainView.swift
//  ChapterKeep
//
//  Created by 이승윤 on 10/29/24.
//

import SwiftUI

struct MainView: View {
    @Binding var state: AppState
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                EmptyView()
                    .tag(0)
                HomeView()
                    .tag(1)
                EmptyView()
                    .tag(2)
                EmptyView()
                    .tag(3)
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ForEach((TabbedItems.allCases), id: \.self) { item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                        Spacer()
                    }
                }
                .padding()
                .background(.white)
                .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 15, topTrailing: 15)))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }

}

extension MainView {
    enum TabbedItems: Int, CaseIterable {
        case search = 0
        case home
        case board
        case profile
        
        var title: String {
            switch self {
            case .search:
                return "검색"
            case .home:
                return "홈"
            case .board:
                return "게시판"
            case .profile:
                return "MY"
            }
        }
        
        var iconName: String {
            // TODO: SF심볼에서 이미지 추가후 해당 이미지로 변경
            switch self {
            case .search:
                return "magnifyingglass"
            case .home:
                return "house"
            case .board:
                return "list.clipboard"
            case .profile:
                return "person"
            }
        }
    }
    
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(isActive ? .accent : .gray)
                .frame(width: 24, height: 24)
            Text(title)
                .font(.system(size: 10))
                .foregroundColor(isActive ? .accent : .gray)
            Spacer()
        }
        .frame(height: 60)
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var state = AppState.main
    MainView(state: $state)
}
