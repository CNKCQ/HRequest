//
//  HRequest.swift
//  OSCHINA
//
//  Created by KingCQ on 2017/1/16.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import Foundation

/// See https://tools.ietf.org/html/rfc7231#section-4.3
public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

class HRequest {
    
    static let `default` = HRequest()
    
    func request(_ uri: String, _ method: HTTPMethod = .get, completed: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = URL(string: uri) else {
            fatalError("an error ocured")
        }
        var request = URLRequest(url: url)
        request.cachePolicy = .returnCacheDataDontLoad // 离线缓存
        request.httpMethod = method.rawValue
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                completed(data, response, error)
        }
        task.resume()
    }
}

struct Response {
    var value: Any?
}
