//
//  MainTabView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 12/10/24.
//

import SwiftUI

enum Tabs: String {
    case Home
    case Explore
    case Notifications
    case Messages
}

struct MainTabView: View {
    
    @State private var selectedIndex: Int = 0
//    @State var selectedTabs: Tabs = .Home
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                        .environment(\.symbolVariants, .none)
                }
                .tag(0)
//                .tag(Tabs.Home)
            
            ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .environment(\.symbolVariants, .none)
                }
                .tag(1)
//                .tag(Tabs.Explore)
            
            NotificationsView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "bell")
                        .environment(\.symbolVariants, .none)
                }
                .tag(2)
//                .tag(Tabs.Notifications)
            
            MessagesView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                        .environment(\.symbolVariants, .none)
                }
                .tag(3)
//                .tag(Tabs.Messages)
        }
//        .navigationTitle(selectedTabs.rawValue)

        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

#Preview {
    MainTabView()
}
