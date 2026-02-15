//
//  DataImportCardswift.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 11.02.26.
//

import SwiftUI

struct DataImportCard: View {
    let image: String
    let title: String
    let secondaryTitle: String
    let isUploaded: Bool
    let onChangeTap: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: image)
                .resizable()
                .renderingMode(.original)
                .foregroundStyle(.blue)
                .frame(width: 50, height: 50)
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top, 8)
            
            Text(secondaryTitle)
                .font(.caption)
                .foregroundStyle(.secondary)

            if isUploaded {
                Button(action: {
                    onChangeTap?()
                }, label: {
                    Text("Change file")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.vertical, 12)
                })
            }
                
        }.padding(.vertical, 32)
            .frame(width: 300, height: 250)
            .padding(.horizontal, 32)
            .background(Color(.systemBackground))
            .clipShape(.rect(cornerRadius: 16))
            .shadow(color: .black.opacity(0.05),radius: 8)
    }
}

#Preview {
    DataImportCard(image: "document.badge.plus.fill", title: "Select Resume", secondaryTitle: "Supports PDF, DOCX", isUploaded: false, onChangeTap: nil)
}
