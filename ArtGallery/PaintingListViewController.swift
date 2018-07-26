//
//  ViewController.swift
//  ArtGallery
//
//  Created by Spencer Curtis on 7/20/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PaintingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PaintingTableViewCellDelegate {

    @IBOutlet weak var tableView: UITableView!
    let paintingController = PaintingController()
    let paintings: [Painting] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        paintingController.loadPaintingsFromAssets()
    }

    func likeButtonWasTapped(on cell: PaintingTableViewCell) {
        
        print("Button tapped")
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let painting = paintingController.paintings[indexPath.row]
        paintingController.toggleIsLiked(for: painting)
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingController.paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaintingCell", for: indexPath)
        guard let paintingCell = cell as? PaintingTableViewCell else {return cell}
        let painting = paintingController.paintings[indexPath.row]
        paintingCell.painting = painting
        paintingCell.delegate = self
        //paintingCell.contentView.isUserInteractionEnabled = true
        
        return paintingCell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 465
    }
}

