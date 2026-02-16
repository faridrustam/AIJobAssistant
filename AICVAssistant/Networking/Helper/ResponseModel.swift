//
//  ResponseModel.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 16.02.26.
//

import Foundation

struct OpenAIResponse: Codable {
    let choices: [Choice]?
}

struct Choice: Codable {
    let message: MessageResponse?
}

struct MessageResponse: Codable {
    let role: String?
    let content: String?
}
