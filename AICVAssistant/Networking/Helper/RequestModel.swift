//
//  OpenAIModel.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 16.02.26.
//

import Foundation

struct OpenAIRequest: Codable {
    let model: String?
    let messages: [Message]?
}

struct Message: Codable {
    let role: String?
    let content: String?
}
