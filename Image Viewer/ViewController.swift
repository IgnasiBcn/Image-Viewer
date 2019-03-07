//
//  ViewController.swift
//  Image Viewer
//
//  Created by user on 25/02/2019.
//  Copyright © 2019 ignasiSwift.com. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fileManager = FileManager.default
        
        let path = Bundle.main.resourcePath!
        print("\nFile manager path: \(String(describing: path))")
        
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        print("\nitems: \(items)")
        
        for item in items {
            if item.hasPrefix("nssl") {
               pictures.append(item)
            }
            
            pictures.sort()
        }
        
        print("\nPictures: \(pictures)")
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
            
            let x = indexPath.row + 1
            vc.selectedPictureNumber = x
            
            let y = pictures.count
            vc.totalPictures = y
            
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
}

