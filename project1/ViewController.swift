//
//  ViewController.swift
//  project1
//
//  Created by KARIM on 2/20/20.
//  Copyright © 2020 KARIM. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
      
        //ref for fileManger
        let fm = FileManager.default
        // images pathes
        let path = Bundle.main.resourcePath ?? "EMPTY PATH"
        //fetch images by fm using path
        let items = try! fm.contentsOfDirectory(atPath: path)
        //get items then add them to add in the arrayt
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        //sort items in array before setting it in table view
        pictures.sort()
        print(pictures)
    }
}

extension ViewController {
    //number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    //cell design
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    //when we click over image
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //instaniate vc and send the image to it
        if let vc = storyboard?.instantiateViewController(withIdentifier: "details") as? DetailsViewController {
            //send image name
            vc.selectedImage = pictures[indexPath.row]
            vc.imagePostion = indexPath.row
            vc.imagesCount = pictures.count
            
            print(pictures.count)
            print(indexPath.row)
            //present
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}

