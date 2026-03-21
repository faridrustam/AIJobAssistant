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
    @Published var result: ATSResponse?
    @Published var isLoaded: Bool = false

    private let manager: ATSCheckerManager
    
    init(manager: ATSCheckerManager) {
        self.manager = manager
    }
    
    func sendRequest() {
        let cv = PDFHelper.extractText(from: selectedFileURL ?? URL(fileURLWithPath: ""))
        manager.sendATS(type: .nano, prompt: .atsScore(cv: cv, job: jobTarget), completion: { response  in
            if let response {
                self.result = response
                self.isLoaded = true
                print(self.result ?? "")
            }
        })
    }
}
