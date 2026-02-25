//
//  ATSCheckerVM.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 15.02.26.
//

import Foundation

final class ATSCheckerVM: ObservableObject {
    
    @Published var isImporterPresented = false
    @Published var isUploaded = false
    @Published var selectedFileURL: URL?
    @Published var jobTarget: String = ""

    private let manager: ChatService
    
    init(manager: ChatService) {
        self.manager = manager
    }
    
    func sendRequest() {
        let cv = PDFHelper.extractText(from: selectedFileURL ?? URL(fileURLWithPath: ""))
        print(jobTarget)
        manager.send(type: .nano, prompt: .atsScore(cv: cv, job: jobTarget), completion: { response in
            if let response {
                print("Success \(response)")
            }
        })
    }
}
