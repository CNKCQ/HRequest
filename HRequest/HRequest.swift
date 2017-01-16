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
    let `default` = HRequest()
    
    func request(_ uri: String, _ method: HTTPMethod = .get ) {
        guard let url = URL(string: uri) else {
            fatalError("an error ocured")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        //        DispatchQueue(label: "request").async {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("data is nil")
                return
            }
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json, "🌹")
        }
        task.resume()
        print(task)
        //        }
    }
}
