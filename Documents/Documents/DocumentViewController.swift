//
//  DocumentViewController.swift
//  Documents
//
//  Created by Clayton Cornett on 8/27/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var filesArray: [URL] = []
    var textFileArray: [TextFile] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //let componentsArray: [String]? = FileManager.default.componentsToDisplay(forPath: documentsURL.absoluteString)
        
        return textFileArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath) as! TextFileTableViewCell
        
        cell.fileNameLabel.text = textFileArray[indexPath.row].Filename
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let componentsArray: [String]? = FileManager.default.componentsToDisplay(forPath: documentsURL.absoluteString)
        
        for component in componentsArray! {
            var fileName = FileManager.default.displayName(atPath: component)
            var fileText = FileManager.default.contents(atPath: component)
            //var fileAttributes = FileManager.default.attributesOfItem(atPath: component)
            
            textFileArray.append(TextFile(Filename: fileName, Text: fileText, FileSize: nil, LastModified: nil))
        }
    }
    
    func createOrModifyFile(){
        var fileName = ""
        var fileText = ""
        var fileURL = documentsURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        
        do{
       try fileText.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        }
        catch let error as NSError{
            print(error)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
