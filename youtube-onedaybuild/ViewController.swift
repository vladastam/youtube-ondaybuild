//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by JH on 6/28/20.
//  Copyright © 2020 JH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
    }


}

