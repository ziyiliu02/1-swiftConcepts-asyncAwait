//
//  NetworkManagerAsyncAwait.swift
//  1-swiftConcepts-asyncAwait
//
//  Created by Liu Ziyi on 10/8/23.
//

import Foundation
import SwiftUI

class NetworkManagerAsyncAwait {
    
    func getImage() async -> UIImage {
        
        // 7. Remote image url
        let imgUrl = "https://media.istockphoto.com/photos/mount-hood-oregon-picture-id1268487061?b=1&k=20&m=1268487061&s=170667a&w=0&h=3fHYwaImlqUETcjCnSV7YO2-PzCFvaX6VSQaiGfWqpc="
        
        // 8. Get url object
        if let url = URL(string: imgUrl) {
            
            // 9. Get the data
            // The "contentsOf" method of Data is synchronous but because of the async keyword above, this is all going to be done by a background thread asynchronously
            let data = try! Data(contentsOf: url)
            
            // 10. Create UIImage and return it
            return UIImage(data: data) ?? UIImage()
            
        } else {
            // Not valid url, so return empty image
            return UIImage()
        }
    }
    
}
