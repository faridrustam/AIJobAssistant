//
//  FeatureCard.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 10.02.26.
//

import SwiftUI

struct FeatureCard: View {
    
    let feature: Feature
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: feature.icon)
                .foregroundStyle(.blue)
                .frame(width: 44, height: 44)
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8) {
                Text(feature.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(feature.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: true, vertical: false)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05),radius: 8)
    }
}

#Preview {
    FeatureCard(feature: Feature(title: "Test", subtitle: "Test", icon: "document.fill", featureType: .ats))
}
