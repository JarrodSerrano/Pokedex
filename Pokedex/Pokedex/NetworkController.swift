//
//  NetworkController.swift
//  Pokedex
//
//  Created by Jarrod Serrano on 4/18/17.
//  Copyright © 2017 Jarrod Serrano. All rights reserved.
//

import Foundation


class NetworkController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    static func performRequest(for url: URL, httpMethod: HTTPMethod,
                               urlParameters: [String: String]? = nil,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil){
        
        let requestURL = self.url(byAdding: urlParameters, to: url)
        var request = URLRequest(url:requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion? (data, error)
            
        }
        dataTask.resume()
    }
    static func url(byAdding parameters: [String: String]?, to url: URL) ->
        URL {
            // grab url from the method parameter to pass into URLComponents
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            // convert parameters into urlQueryitems
            components?.queryItems = parameters?.flatMap { URLQueryItem(name: $0.key, value: $0.value)
            }
            
            //unwrap URL based off components
            guard let url = components?.url else {
                fatalError("URL optional is nil")
            }
            return url
            
    }
}
