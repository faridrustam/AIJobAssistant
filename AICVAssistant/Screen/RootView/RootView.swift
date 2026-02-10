//
//  RootView.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 10.02.26.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            Text("Files")
                .tabItem {
                    Label("Files", systemImage: "folder")
                }

            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    RootView()
}
