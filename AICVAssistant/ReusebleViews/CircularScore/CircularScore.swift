//
//  ProgressCard.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 21.03.26.
//

import Foundation
import SwiftUI

struct CircularScore: View {
    var score: Double
    var maxScore: Double = 100
    var feedback: String = ""
    
    @State private var animatedProgress: Double = 0
    
    var progress: Double {
        score / maxScore
    }
    
    func giveFeedback(_ score: Int) -> String {
        switch score {
        case 0..<40:
            return "Poor"
        case 40..<60:
            return "Below Average"
        case 60..<75:
            return "Average"
        case 75..<85:
            return "Good"
        case 85..<95:
            return "Strong"
        case 95...100:
            return "Excellent"
        default:
            return "Invalid score"
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 14)
                
                Circle()
                    .trim(from: 0, to: animatedProgress)
                    .stroke(
                        Color.blue,
                        style: StrokeStyle(lineWidth: 14, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 1.2), value: animatedProgress)
                
                VStack(spacing: 4) {
                    Text("\(Int(score))")
                        .font(.system(size: 40, weight: .bold))
                    
                    Text("/\(Int(maxScore))")
                        .foregroundColor(.gray)
                    
                    Text("\(giveFeedback(Int(score)))")
                        .font(.callout)
                        .foregroundColor(.blue)
                }
            }
            .onAppear {
                animatedProgress = progress
            }
            
            Text("ATS-style compatibility score")
                .padding()
                .font(.subheadline)
                .foregroundColor(.secondary)
                
        }.frame(width: 280, height: 230)
            .padding(32)
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.05), radius: 8)
    }
}

#Preview {
    CircularScore(score: 70)
}
