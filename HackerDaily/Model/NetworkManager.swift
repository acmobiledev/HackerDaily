//
//  NetworkManager.swift
//  HackerDaily
//
//  Created by Amit Chaudhary on 7/21/21.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()    // (@published is just like change property of property observers (observed, change)
    
    func fetchData() {
        if let safeURL = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: safeURL) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results =  try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                    
                }
            }
            task.resume()
        }
    }
}



struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    //stored properties
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    // read-only computed property
    var id: String {
        return objectID
    }
}
