//
//  SwiftUIView.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 21.03.26.
//

import SwiftUI

struct ATSCheckResultView: View {
    @State var data: ATSResponse
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                CircularScore(score: Double(data.score))
                    .frame(maxWidth: .infinity)
                
                Text("Critical Warnings")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .padding()
                
                ForEach(data.warnings, id: \.id) { warning in
                    VStack(alignment: .leading, spacing: 4) {
                        CriticalWarningCard(title: warning.title, description: warning.description)
                    }
                }     
            }.navigationTitle("ATS Analysis")
        }
    }
}

#Preview {
    ATSCheckResultView(data: ATSResponse(score: 70, warnings: [Warning(title: "", description: "")], missingKeywords: [""], suggestions: [Suggestion(title: "", description: "")]))
}
