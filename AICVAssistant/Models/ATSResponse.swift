//
//  ATSResponse.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 03.03.26.
//

import Foundation

struct ATSResponse: Codable {
    let score: Int
    let warnings: [Warning]
    let missingKeywords: [String]
    let suggestions: [Suggestion]
}

struct Warning: Codable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
            case title
            case description
        }
}

struct Suggestion: Codable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
            case title
            case description
        }
}
