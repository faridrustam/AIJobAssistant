//
//  ATSCheckerView.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 12.02.26.
//

import SwiftUI

struct ATSCheckerView: View {
    
    @State var fullText: String = "Paste the job description here..."
    @StateObject private var vm = ATSCheckerVM(manager: ChatService())
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("UPLOAD RESUME")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .padding(.horizontal)
                .padding(.top, 12)
            
            if let fileURL = vm.selectedFileURL {
                DataImportCard(
                    image: "checkmark.circle.fill",
                    title: "Resume Uploaded",
                    secondaryTitle: fileURL.lastPathComponent,
                    isUploaded: true,
                    onChangeTap: {
                        vm.isImporterPresented = true
                        print(vm.isImporterPresented)
                    }
                )
                .padding(.horizontal)

            } else {
                DataImportCard(
                    image: "document.badge.plus.fill",
                    title: "Select Resume",
                    secondaryTitle: "Supports PDF, DOCX",
                    isUploaded: false,
                    onChangeTap: nil
                )
                .padding(.horizontal)
                .onTapGesture {
                    vm.isImporterPresented = true
                }
            }
            
            Text("TARGET JOB (OPTIONAL)")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .padding(.horizontal)
            
            TextEditor(text: $fullText)
                .padding(12)
                .frame(height: 150)
                .background(Color(.systemBackground))
                .font(.system(size: 16))
                .clipShape(.rect(cornerRadius: 16))
                .shadow(color: .black.opacity(0.05),radius: 8)
                .padding(.horizontal)
            
            Text("Adding the job description helps our AI tailor the keywords analysis specifically for the role you are targeting.")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            
            Spacer()
            
            ZStack {
                Rectangle()
                    .fill(Color(.systemBackground))
                    .ignoresSafeArea()
                    .frame(height: 110)
                
                VStack {
                    Button(action: {
                        
                    }, label: {
                        Text("💫 Analyze ATS Score")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(width: 300)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                    
                    HStack(spacing: 4) {
                        
                        Image(systemName: "lock.fill")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .padding(.top, 4)
                        
                        Text("Files are processed securely and not stored.")
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                            .padding(.top, 4)
                    }
                }
            }
        }
        .background(Color.app)
        .navigationTitle("ATS Checker")
        .navigationBarTitleDisplayMode(.inline)
        .fileImporter(isPresented: $vm.isImporterPresented, allowedContentTypes: [.pdf, .plainText], allowsMultipleSelection: false) { result in
            switch result {
            case .success(let urls):
                if let fileURL = urls.first {
                    vm.selectedFileURL = fileURL
                    print("Selected file: \(fileURL)")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ATSCheckerView()
}
