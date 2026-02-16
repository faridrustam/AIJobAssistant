//
//  ChatService.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 16.02.26.
//

import Foundation

final class ChatService {
    func send(type: GptType, prompt: PromptStyle, completion: @escaping(String?) -> Void) {
        let body = OpenAIRequest(
            model: type.rawValue,
            messages: [
                Message(role: "user", content: prompt.text)
            ]
        )
        
        NetworkManager().request(
            path: NetworkHelper.shared.chatCompletions(),
            body: body,
            responseModel: OpenAIResponse.self
        ) { response, _ in
            completion(response?.choices?.first?.message?.content)
        }
    }
}
