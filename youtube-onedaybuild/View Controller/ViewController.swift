//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by JH on 6/28/20.
//  Copyright © 2020 JH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set  itself as the datasource and the  delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as  the delegate of  the model
        model.delegate = self
        
        model.getVideos()
        
    }
    // MARK:  - Model Delegate  Methods
    
    func  videosFatched(_ videos: [Video]) {
        
        //  Set the returned videos  to our video  property
        self.videos = videos
        
        // Refresh the tableview
        tableView.reloadData()
        
    }
    
    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        // Configure the cell with the data
        // Get  the title for the video in question
        let video =  self.videos[indexPath.row]
        
        cell.setCell(video)
        
        // return the  cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

