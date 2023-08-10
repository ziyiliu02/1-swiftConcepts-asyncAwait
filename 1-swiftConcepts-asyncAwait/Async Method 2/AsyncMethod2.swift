//
//  AsyncMethod2.swift
//  1-swiftConcepts-asyncAwait
//
//  Created by Liu Ziyi on 10/8/23.
//

import SwiftUI

struct AsyncMethod2: View {
    
    // ASYNC METHOD 2 (Background thread in different file)
    
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
        
        // 4. Create manager
        let manager = NetworkManagerAsync()
        
        // 5. Call the getImage method
        manager.getImage { uiImage in
            
            // 16. Set the returned UIImage to the image property
            self.image = uiImage
        }
        
        // 11. Execution is not blocked and will continue
        self.image = UIImage(named: "plant")!
    }
}

struct AsyncMethod2_Previews: PreviewProvider {
    static var previews: some View {
        AsyncMethod2()
    }
}
