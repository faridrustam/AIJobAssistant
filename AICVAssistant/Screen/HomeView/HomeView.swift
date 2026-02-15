//
//  ContentView.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 08.02.26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeVM()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
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
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 24)
                .padding(.leading, 16)
                
                VStack(alignment: .center, spacing: 16) {
                    ForEach(viewModel.features) { feature in
                        NavigationLink(value: feature.featureType) {
                            FeatureCard(feature: feature)
                                .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                }
                
                VStack(spacing: 16) {
                    HStack {
                        Text("Recent Documents")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button("See All") {}
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            DocumentCard()
                            DocumentCard()
                            DocumentCard()
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 250)
                    .padding(.horizontal, -16)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.app)
            .navigationDestination(for: FeatureType.self) { type in
                switch type {
                case .cv:
                    Text("CV")
                case .coverLetter:
                    Text("Cover Letter")
                case .ats:
                    ATSCheckerView()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
