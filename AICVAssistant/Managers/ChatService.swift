//
//  ChatService.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 16.02.26.
//

import Foundation

final class ChatService {
    func send<T>(type: GptType,
                 prompt: PromptStyle,
                 expecting: T.Type,
                 completion: @escaping (T?) -> Void) {
        let body = OpenAIRequest(model: type.rawValue,
                                 messages: [Message(role: "user", content: prompt.text)])
        
        NetworkManager().request(path: NetworkHelper.shared.chatCompletions(),
                                 body: body,
                                 responseModel: OpenAIResponse.self) { response, _ in
            guard let content = response?.choices?.first?.message?.content else {
                completion(nil)
                return
            }
            
            if T.self == String.self {
                completion((content as! T))
                return
            }
            
            let cleaned = content
                .replacingOccurrences(of: "```json", with: "")
                .replacingOccurrences(of: "```", with: "")
            
            guard let data = cleaned.data(using: .utf8) else {
                completion(nil)
                return
            }
            
            if let decodableType = T.self as? Decodable.Type {
                do {
                    let decoded = try JSONDecoder().decode(decodableType, from: data)
                    completion(decoded as? T)
                } catch {
                    print("Decoding error:", error)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
}
