//
//  CoverLetterManager.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 09.03.26.
//

import Foundation


protocol CoverLetterUseCase {
    func sendCoverLetter(type: GptType, prompt: PromptStyle, completion: @escaping (String?) -> Void)
}

final class CoverLetterManager: CoverLetterUseCase {
    let manager = ChatService()
    
    func sendCoverLetter(type: GptType,
                         prompt: PromptStyle,
                         completion: @escaping (String?) -> Void) {
        manager.send(type: type, prompt: prompt, expecting: String.self, completion: completion)
    }
}
