//
//  CacheManger.swift
//  youtube-onedaybuild
//
//  Created by JH on 7/2/20.
//  Copyright © 2020 JH. All rights reserved.
//

import Foundation

class CacheMangeer {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?) {
        
        // Store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        // Try to get the data for the specified url
        return cache[url]
    }
 
}
