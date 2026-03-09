//
//  ATSCheckerManager.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 09.03.26.
//

import Foundation

protocol ATSCheckerUseCase {
    func sendATS(type: GptType,prompt: PromptStyle, completion: @escaping (ATSResponse?) -> Void)
}

final class ATSCheckerManager: ATSCheckerUseCase {
    let manager = ChatService()
    
    func sendATS(type: GptType,
                 prompt: PromptStyle,
                 completion: @escaping (ATSResponse?) -> Void) {
        manager.send(type: type, prompt: prompt, expecting: ATSResponse.self, completion: completion)
    }
}
