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
        //tableView.indexPath(for: UITableViewCell)
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintingController.paintings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaintingCell", for: indexPath)
        guard let paintingCell = cell as? PaintingTableViewCell else {return cell}
        let painting = paintingController.paintings[indexPath.row]
        paintingCell.painting = painting
        
        
        return paintingCell

    }
    
}

