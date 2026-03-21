//
//  ATSCheckerView.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 12.02.26.
//

import SwiftUI

struct ATSCheckerView: View {
    @StateObject private var vm = ATSCheckerVM(manager: ATSCheckerManager())
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("UPLOAD RESUME")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                    .padding(.top, 12)
                
                importerCard
                
                Text("TARGET JOB (OPTIONAL)")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                
                TextField(
                    "Enter your target job title",
                    text: $vm.jobTarget
                )
                .padding(12)
                .frame(height: 60)
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
                
                VStack {
                    Button(action: {
                        vm.sendRequest()
                    }, label: {
                        Text("💫 Analyze ATS Score")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    }).padding(.horizontal, 12)
                    
                    Text("Files are processed securely and not stored.")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                }.padding(.vertical, 32)
            }
            .navigationTitle("ATS Checker")
            .navigationDestination(isPresented: $vm.isLoaded, destination: {
                ATSCheckResultView(data: vm.result ?? ATSResponse(score: 0, warnings: [Warning(title: "", description: "")], missingKeywords: [""], suggestions: [Suggestion(title: "", description: "")]))
            })
            .navigationBarTitleDisplayMode(.inline)
            .fileImporter(isPresented: $vm.isImporterPresented, allowedContentTypes: [.pdf, .plainText], allowsMultipleSelection: false) { result in
                switch result {
                case .success(let urls):
                    if let fileURL = urls.first {
                        vm.selectedFileURL = fileURL
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        .background(Color.app)
    }
}

private extension ATSCheckerView {
    var importerCard: AnyView {
        if let fileURL = vm.selectedFileURL {
            AnyView(
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
            )
            
        } else {
            AnyView(
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
            )
        }
    }
}

#Preview {
    ATSCheckerView()
}
