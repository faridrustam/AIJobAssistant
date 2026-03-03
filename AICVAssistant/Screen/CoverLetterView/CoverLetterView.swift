//
//  CoverLetterView.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 26.02.26.
//

import SwiftUI

struct CoverLetterView: View {
    
    @StateObject private var vm = CoverLetterVM(manager: ChatService())
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("TARGET ROLE")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundStyle(.black)
                .padding(.horizontal)
                .padding(.top, 12)
            
            VStack(spacing: 0) {
                HStack(spacing: 20) {
                    Text("Job Title")
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    TextField("e.g. Product Designer", text: $vm.jobTitle)
                }
                .padding()
                .background(Color(.white))
                
                Divider()

                HStack(spacing: 20) {
                    Text("Company")
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    TextField("e.g. Acme Corp", text: $vm.company)
                }
                .padding()
                .background(Color(.white))
            }
            .foregroundStyle(.background)
            .cornerRadius(16)
            .padding(.horizontal)
            
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
            
            Text("TONE")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .padding(.horizontal)
                .padding(.top, 12)
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .frame(height: 60)
                
                Picker("Tone", selection: $vm.selectedTone) {
                    Text("Professional").tag(Tone.professional)
                    Text("Friendly").tag(Tone.friendly)
                    Text("Confident").tag(Tone.confident)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }
            .padding(.horizontal)
            
            ZStack {
                Rectangle()
                    .fill(Color(.systemBackground))
                    .ignoresSafeArea()
                    .frame(height: 110)
                
                VStack {
                    Button(action: {
                        vm.sendRequest()
                    }, label: {
                        Text("💫 Generate Cover Letter")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(width: 300)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    })
                }
            }
        }
        .background(Color.app)
        .navigationTitle("Cover Letter")
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
}

#Preview {
    CoverLetterView()
}
