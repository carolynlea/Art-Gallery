//
//  Painting.swift
//  ArtGallery
//
//  Created by Carolyn Lea on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class Painting {
    var paintingImage: UIImage
    var isLiked: Bool
    
    init(painting: UIImage, liked: Bool = false) {
        self.paintingImage = painting
        self.isLiked = liked
        
    }
}
