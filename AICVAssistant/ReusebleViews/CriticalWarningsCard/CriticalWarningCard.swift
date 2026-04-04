//
//  CriticalWarningCard.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 21.03.26.
//

import Foundation
import SwiftUI

struct CriticalWarningCard: View {
    let title: String
    let description: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemGray6))
                .shadow(color: .black.opacity(0.05),radius: 8)
            
            LeftCapsule()
                .fill(Color.orange)
                .frame(width: 16)
           
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(.orange)
                    .font(.title3)
                    .padding(.leading, 12)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("\(title)")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("\(description)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding()
        }
        .frame(minHeight: 140)
        .padding(.horizontal)
    }
}

#Preview {
    CriticalWarningCard(title: "Lack of Specific Keywords for Legal Roles", description: "The CV does not explicitly include specific keywords such as \'contract law,\' \'dispute resolution,\' \'litigation,\' \'legal advising,\' \'regulatory compliance,\' or \'corporate law,\' which are often critical for ATS filtering in legal roles.")
}
