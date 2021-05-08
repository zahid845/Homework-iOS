//
//  Networking.swift
//  Homework-iOS
//
//  Created by Admin on 5/8/21.
//

import Foundation


struct Networking {
    
    private init() {}
    static let shared = Networking()
    
    // MARK - Fetch JSON Data
    func fetchJSON(url: URL, completion: @escaping (Result<[Applicable], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let jsonData = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 || httpResponse.statusCode == 200, error == nil else {
                
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    
                    completion(.failure(.domainError))
                    completion(.failure(.responseError))
                }
                return
            }
            
            //MARK: Get Data Back
            do {
                
                let decoder = JSONDecoder()
                let data = try decoder.decode(ListResult.self, from: jsonData)
                
                completion(.success((data.networks?.applicable)!))
            } catch {
                completion(.failure(.decodingError))
            }
        } .resume()
    }
    
    

}
