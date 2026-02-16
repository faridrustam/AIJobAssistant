//
//  NetworkManager.swift
//  AICVAssistant
//
//  Created by Farid Rustamov on 16.02.26.
//

import Foundation
import Alamofire

final class NetworkManager {
    func request<T: Codable, U: Codable>(path: String,
                                         method: HTTPMethod = .post,
                                         body: T,
                                         responseModel: U.Type,
                                         completion: @escaping((U?, String?) -> Void)) {
        AF.request(path,
                   method: method,
                   parameters: body,
                   encoder: JSONParameterEncoder.default,
                   headers: NetworkHelper.shared.header).responseDecodable(of: responseModel.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
