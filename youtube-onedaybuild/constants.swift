//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by JH on 6/29/20.
//  Copyright © 2020 JH. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyD-VyaZ5g6N_jSBmRz1nJDFIDkHxhZxhpQ"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}
