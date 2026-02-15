//
//  DocumentCard.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 10.02.26.
//

import SwiftUI

struct DocumentCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 160, height: 120)
            
            Text("Edited 2h ago")
                .font(.caption)
                .foregroundStyle(.gray)
                .frame(height: 24)
            
            Text("Software Engineer CV")
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(2)
        }
        .frame(width: 160)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 8)
    }
}

#Preview {
    DocumentCard()
}
