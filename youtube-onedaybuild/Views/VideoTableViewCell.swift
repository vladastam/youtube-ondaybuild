//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by JH on 7/2/20.
//  Copyright © 2020 JH. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v:Video){
        
        self.video =  v
        
        // Ensure that we have a video
        guard self.video != nil else{
            return
        }
        
        // Set the title and date label
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat =  "EEEE, MMM d, yyyy"
        self.dateLabel.text  = df.string(from: video!.published)
        
        // Set the thumnail
        guard self.video!.thumbnail != "" else{
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheMangeer.getVideoCache(self.video!.thumbnail){
            
            // set the thumnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Download the thumnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the  shared URL session object
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save the data in the cache
                CacheMangeer.setVideoCache(url!.absoluteString, data)
                
                // Check that the download url matches the video thumbnail url that this cell is currently set to display
                
                if url!.absoluteString != self.video?.thumbnail  {
                    //Video cell has been reccled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                // Create the image object
                let image = UIImage(data: data!)
                
                // Set the imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image  = image
                }
                
                
            }
            
        }
        // Start data task
        dataTask.resume()
    }
}
