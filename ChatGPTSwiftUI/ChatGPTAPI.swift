//
//  ChatGPTAPI.swift
//  ChatGPTSwiftUI
//
//  Created by hongpeng on 3/18/24.
//  Copyright © 2024 480814177. All rights reserved.
//

import Foundation

class ChatGPTAPI {
    private let apiKey: String
    private let urlSession = URLSession.shared
    private var headers: [String: String] {
        [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
    }
    
    private var urlRequest: URLRequest {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
        return urlRequest
    }
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func sendMessage(_ text: String) async throws -> String {
        var urlRequest = self.urlRequest
        // TODO: netwokring
        return ""
    }
}
