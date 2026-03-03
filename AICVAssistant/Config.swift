//
//  Config.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 03.03.26.
//

import Foundation

struct Config {
    static var openAIKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "OPENAI_API_KEY") as? String else {
            fatalError("OPENAI_API_KEY not found in Info.plist")
        }
        return key
    }
}
