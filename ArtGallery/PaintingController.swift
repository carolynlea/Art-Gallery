//
//  PaintingController.swift
//  ArtGallery
//
//  Created by Carolyn Lea on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class PaintingController {
    
    var paintings: [Painting] = []
    var painting: Painting?
    
    func loadPaintingsFromAssets() {
        
        for image in 1...12 {
            
            let imageName = "Image\(image)"
            guard let image = UIImage(named: imageName) else {continue}
            let painting = Painting(painting: image)
            paintings.append(painting)
            
        }
        
    }
    
    func toggleIsLiked(for painting: Painting){
        painting.isLiked = !painting.isLiked
    }
    
    
}
