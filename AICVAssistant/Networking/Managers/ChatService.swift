//
//  ChatService.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 16.02.26.
//

import Foundation

final class ChatService {
    func send(type: GptType, prompt: PromptStyle, completion: @escaping (ATSResponse?) -> Void) {
        let body = OpenAIRequest(model: type.rawValue,
                                 messages: [Message(role: "user", content: prompt.text)])
        
        NetworkManager().request(path: NetworkHelper.shared.chatCompletions(),
                                 body: body,
                                 responseModel: OpenAIResponse.self) { response, _ in
            guard let content = response?.choices?.first?.message?.content else {
                completion(nil)
                return
            }
            
            let cleaned = content
                .replacingOccurrences(of: "```json", with: "")
                .replacingOccurrences(of: "```", with: "")
            
            guard let data = cleaned.data(using: .utf8) else {
                completion(nil)
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(ATSResponse.self, from: data)
                completion(decoded)
            } catch {
                print("Decoding error:", error)
                completion(nil)
            }
        }
    }
}
