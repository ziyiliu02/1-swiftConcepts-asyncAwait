//
//  AsyncMethod1.swift
//  1-swiftConcepts-asyncAwait
//
//  Created by Liu Ziyi on 10/8/23.
//

import SwiftUI

struct AsyncMethod1: View {
    
    // ASYNC METHOD 1 (Background thread in the same code file)
    
    // 1. Empty image
    @State var image = UIImage()
    
    var body: some View {
        
        // 2. Display an image
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .onAppear {
                // 3. On appear, get image from url
                loadImage()
            }
    }
    
    func loadImage() {
        
        // 4. Remote image url
        let imgUrl = "https://media.istockphoto.com/photos/mount-hood-oregon-picture-id1268487061?b=1&k=20&m=1268487061&s=170667a&w=0&h=3fHYwaImlqUETcjCnSV7YO2-PzCFvaX6VSQaiGfWqpc="
        
        // ** This doesn't work
//        let imgUrl = "https://unsplash.com/photos/klH-f7mw2Ws"
        
        // 5. Get url object
        if let url = URL(string: imgUrl) {
            
            // 6. Get shared URL Session
            let session = URLSession.shared
            
            // 7. Create data task
            // This data task makes a request to the URL in another thread, asynchronously
            let task = session.dataTask(with: url) { data, response, error in
                
                // 10. Background async thread returns
                if error == nil && data != nil {
                    
                    // 11. Turn data into a UIImage object
                    let uiImage = UIImage(data: data!) ?? UIImage()
                    
                    // 12. Specify that you want the following work to be performed by the main thread
                    DispatchQueue.main.async {
                        
                        // 13. Assign new UIImage object to state property
                        self.image = uiImage
                    }
                }
                
            }
            
            // 8. Start the data task (in background asynchronously)
            task.resume()
            
            // 9. Execution is not blocked and will continue
            self.image = UIImage(named: "plant")!
        }
        
    }
}

struct AsyncMethod1_Previews: PreviewProvider {
    static var previews: some View {
        AsyncMethod1()
    }
}
