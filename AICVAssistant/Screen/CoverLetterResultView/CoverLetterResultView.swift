//
//  CoverLetterResult.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 14.03.26.
//

import SwiftUI

struct CoverLetterResultView: View {
    @State var data: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: $data)
                .focused($isFocused)
                .padding(8)
                .scrollContentBackground(.hidden)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                .padding(.bottom, 12)
            
            Text("This content is AI-generated. Please review and edit before sending.")
                        .font(.caption2)
                        .foregroundColor(.gray)
            
            HStack(spacing: 16) {
                Button {
                    // save
                } label: {
                    HStack {
                        Image(systemName: "bookmark.fill")
                            .fontWeight(.bold)
                        Text("Save Draft")
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.background)
                    .cornerRadius(12)
                }.frame(width: 160)
                
                Button {
                    // regenerate
                } label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                            .fontWeight(.bold)
                        Text("Regenerate")
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }.frame(width: 160)
            }.padding(.bottom, 8)
        }.background(Color.app)
            .navigationTitle("Cover Letter")
            .onTapGesture {
                isFocused = false
                hideKeyboard()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
    }
}

#Preview {
    CoverLetterResultView(data: "")
}
