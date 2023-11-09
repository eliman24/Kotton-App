//
//  ViewModel.swift
//  Kotton App
//
//  Created by Elisabeth Manalo on 11/2/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var items = [PostModel]()
    let prefixUrl = "http://localhost:3000"
    
    init() {
        fetchPosts()
    }
    
    // retrieve data
    func fetchPosts() {
        guard let url = URL(string: "\(prefixUrl)/posts") else {
            print("Not found url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("No data")
                }
                
            } catch let JsonError {
                print("fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // create new data
    func createPost(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/createPost") else {
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
                
            } catch let JsonError {
                print("fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // update data
    func updatePost(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/updatePost") else {
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
                
            } catch let JsonError {
                print("fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }
    
    // delete data
    func deletePost(parameters: [String: Any]) {
        guard let url = URL(string: "\(prefixUrl)/deletePost") else {
            print("Not found url")
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, error) in
            if error != nil {
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        print(result)
                    }
                } else {
                    print("No data")
                }
                
            } catch let JsonError {
                print("fetch json error", JsonError.localizedDescription)
            }
        }.resume()
    }
}
