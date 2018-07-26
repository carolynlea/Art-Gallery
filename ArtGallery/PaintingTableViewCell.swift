//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by Carolyn Lea on 7/25/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol PaintingTableViewCellDelegate: class {
    func likeButtonWasTapped(on cell:PaintingTableViewCell)
    
}
class PaintingTableViewCell: UITableViewCell {

    @IBOutlet weak var paintingImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    weak var delegate: PaintingTableViewCellDelegate?
    
    var painting: Painting? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func like(_ sender: Any) {
        
        delegate?.likeButtonWasTapped(on: self)
       
    }
    
    private func updateViews() {
        
        guard let painting = painting else {return}
        paintingImageView.image = painting.paintingImage
        
        //let likeButtonTitle = painting.isLiked ? "Unlike" : "Like"
        //likeButton.setTitle(likeButtonTitle, for: .normal)
        var likeButtonTitle: String
        if !painting.isLiked {
            likeButtonTitle = "Like"
        } else {
            likeButtonTitle = "Unlike"
        }
        likeButton.setTitle(likeButtonTitle, for: .normal)
        
    }
    
    
}
