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
}
