//
//  DataService.swift
//  CitySightsApp
//
//  Created by Anand Narayan on 2022-06-21.
//

import Foundation
import UIKit


class DataService: ObservableObject {
    
    
    let session: URLSession = URLSession.shared
    
    @Published var yelpImage: UIImage?
    
    func getCurrentIcon(imageUrl: String) {
        
        let sendingUrl = URL(string: imageUrl)
        var request = URLRequest(url: sendingUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        request.httpMethod = "GET"
        let dataTask = self.session.dataTask(with: request) { (data, response, error) in
            self.responseIconHandler(data: data, response: response, error: error)
        }
        dataTask.resume()
    }
    
    func responseIconHandler(data:Data?, response: URLResponse?, error: Error?) {
        if (error == nil && data != nil) {
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
           
                self.yelpImage = image
                    
            }
                
            
        }
    }
    

}
