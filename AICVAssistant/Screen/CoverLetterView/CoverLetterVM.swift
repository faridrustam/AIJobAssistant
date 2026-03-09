//
//  ATSCheckerVM.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 15.02.26.
//

import Foundation

enum Tone: String, CaseIterable {
    case professional = "Professional"
    case friendly = "Friendly"
    case confident = "Confident"
}

final class CoverLetterVM: ObservableObject {
    
    @Published var isImporterPresented = false
    @Published var isUploaded = false
    @Published var selectedFileURL: URL?
    @Published var jobTitle: String = ""
    @Published var company: String = ""
    @Published var selectedTone: Tone = .professional
    @Published var result: String = ""

    private let manager: CoverLetterManager
    
    init(manager: CoverLetterManager) {
        self.manager = manager
    }
    
    func sendRequest() {
        let cv = PDFHelper.extractText(from: selectedFileURL ?? URL(fileURLWithPath: ""))
        manager.sendCoverLetter(type: .nano, prompt: .coverLetter(cv: cv, job: jobTitle, company: company, tone: selectedTone.rawValue), completion: { response  in
            if let response {
                self.result = response
                print("Success \(response)")
            }
        })
    }
}
