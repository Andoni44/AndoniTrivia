//
//  ApiFactory+LoadNewGame.swift
//  AndoniTrivia
//
//  Created by Andoni Da silva on 9/1/21.
//

import Foundation

extension ApiFactory {
    
    func loadNewGame(onSuccess: @escaping ([Game]) -> Void, onFailure: @escaping (String?) -> Void) {
        let urlString = self.baseUrl + self.basicGame
        var request = URLRequest(url: URL(string: urlString)!)
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: self as? URLSessionDelegate, delegateQueue: nil)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) {(data, response, error) in
            
            guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
                return
            }
            if response.statusCode == 200 {
                do {
                    let decoder = JSONDecoder()
                    let serviceResult = try decoder.decode(Service.self, from: data)
                    onSuccess(serviceResult.game)
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    onFailure(error.localizedDescription)
                }
                
            } else {
                let message = String(data: data, encoding: .utf8)
                onFailure(message)
            }
        }.resume()
    }
}
