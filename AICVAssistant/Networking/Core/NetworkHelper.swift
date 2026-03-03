//
//  NetworkHelper.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 16.02.26.
//

import Foundation
import Alamofire

enum EncodingType {
    case url
    case json
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private init() {}
    
    let baseURL = "https://api.openai.com/v1"
    let header: HTTPHeaders = ["Authorization": "Bearer \(Config.openAIKey)"]
    
    func chatCompletions() -> String {
            return baseURL + "/chat/completions"
        }
}
