//
//  ContentView.swift
//  1-swiftConcepts-asyncAwait
//
//  Created by Liu Ziyi on 10/8/23.
//

import SwiftUI

struct ContentView: View {
    
    // 1) SYNCHRONOUS
    
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
        let imageUrl = "https://media.istockphoto.com/photos/mount-hood-oregon-picture-id1268487061?b=1&k=20&m=1268487061&s=170667a&w=0&h=3fHYwaImlqUETcjCnSV7YO2-PzCFvaX6VSQaiGfWqpc="
        
        // 5. Get url object
        if let url = URL(string: imageUrl) {
            
            // 6. Get data from url
            let data = try! Data(contentsOf: url)
            
            // 7. Turn data into a UIImage object
            let uiImage = UIImage(data: data) ?? UIImage()
            
            // 8. Assign new UIImage object to state property
            image = uiImage
        }
        
        // 9.
        self.image = UIImage(named: "plant")!
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
