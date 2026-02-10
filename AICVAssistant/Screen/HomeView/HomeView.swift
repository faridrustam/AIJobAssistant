//
//  ContentView.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 08.02.26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text("AI Job Assistant")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
                
                Text("Optimize your career journey")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            VStack(alignment: .center, spacing: 16) {
                FeatureCard()
                FeatureCard()
                FeatureCard()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        
    }
}

#Preview {
    HomeView()
}
