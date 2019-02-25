//
//  ViewController.swift
//  Image Viewer
//
//  Created by user on 25/02/2019.
//  Copyright © 2019 ignasiSwift.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fileManager = FileManager.default
        
        let path = Bundle.main.resourcePath!
        print("\nFile manager path: \(String(describing: path))")
        
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        print("\nitems: \(items)")
        
        for item in items {
            if item.hasPrefix("nssl") {
               pictures.append(item)
            }
        }
        
        print("\nPictures: \(pictures)")
    }


}

