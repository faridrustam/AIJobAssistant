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

            ATSCheckResultView(data: ATSResponse(score: 70, warnings: [Warning(title: "Salam", description: "")], missingKeywords: [""], suggestions: [Suggestion(title: "", description: "")]))
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
