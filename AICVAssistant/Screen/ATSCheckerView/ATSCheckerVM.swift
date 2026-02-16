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
    var success: (() -> Void)?
    
    private let manager: ChatService
    
    init(manager: ChatService) {
        self.manager = manager
    }
    
    func sendRequest() {
        manager.send(type: .nano, prompt: .atsScore(cv: "", job: ""), completion: { response in
            if let response {
                print("Success \(response)")
                self.success?()
            }
        })
    }
}
