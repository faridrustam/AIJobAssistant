//
//  CoverLetterResult.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 14.03.26.
//

import SwiftUI

struct CoverLetterResultView: View {
    @State var data: String
    
    var body: some View {
        ScrollView {
            TextEditor(text: $data)
                .padding(.horizontal)
        }
    }
}

#Preview {
    CoverLetterResultView(data: "")
}
