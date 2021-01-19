//
//  NetworkManager.swift
//  SwiftUI_App
//
//  Created by 于鸿鹏 on 2021/1/15.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

import Foundation
import Alamofire

private let baseURL = ""
class NetworkManager {
    static let shared = NetworkManager()
    func requestGet(path: String, param: Parameters?, completion: @escaping (Result<Data, Error>) -> Void) -> DataRequest {
        AF.request(baseURL + path, method: .get, parameters: param, headers: ["user_id": "123"], requestModifier: {$0.timeoutInterval = 15})
            .responseData { response in
                switch response.result {
                case let .success(data):
                    completion(.success(data))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
}
