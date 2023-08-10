//
//  NetworkManagerAsync.swift
//  1-swiftConcepts-asyncAwait
//
//  Created by Liu Ziyi on 10/8/23.
//

import Foundation
import SwiftUI

class NetworkManagerAsync {
    
    func getImage(completion: @escaping (UIImage) -> Void) {
        
        // 6. Remote image url
        let imgUrl = "https://media.istockphoto.com/photos/mount-hood-oregon-picture-id1268487061?b=1&k=20&m=1268487061&s=170667a&w=0&h=3fHYwaImlqUETcjCnSV7YO2-PzCFvaX6VSQaiGfWqpc="
        
        // 7. Get url object
        if let url = URL(string: imgUrl) {
            
            // 8. Get shared URL Session
            let session = URLSession.shared
            
            // 9. Create data task
            // This data task makes a request to the URL in another thread, asynchronously
            let task = session.dataTask(with: url) { data, response, error in
                
                // 12. Background async thread returns
                if error == nil && data != nil {
                    
                    // 13. Turn data into a UIImage object
                    let uiImage = UIImage(data: data!) ?? UIImage()
                    
                    // 14. Specify that you want the following work to be performed by the main thread
                    DispatchQueue.main.async {
                        
                        // 15. Call the function that was passed in as a parameter
                        completion(uiImage)
                    }
                }
                
            }
            
            // 10. Start the data task (in background asynchronously)
            task.resume()
        }
    }
    
}
