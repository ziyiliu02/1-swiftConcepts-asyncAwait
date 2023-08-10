//
//  AsyncAwait.swift
//  1-swiftConcepts-asyncAwait
//
//  Created by Liu Ziyi on 10/8/23.
//

import SwiftUI

struct AsyncAwait: View {
    
    // ASYNC AWAIT
    
    // 1. Empty Image
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
        
        Task.init {
            // 4. Create an instance of the network manager
            let manager = NetworkManagerAsyncAwait()
            
            // 5. Call get image of the manager and assign to property
            // 11. Background thread comes back and assigns result to image property
            self.image = await manager.getImage()
        }
        
        // 6.
        self.image = UIImage(named: "plant")!
        
    }
    
}

struct AsyncAwait_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwait()
    }
}
