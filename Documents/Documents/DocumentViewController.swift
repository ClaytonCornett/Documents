//
//  DocumentViewController.swift
//  Documents
//
//  Created by Clayton Cornett on 8/27/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//

import UIKit

class DocumentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var addFileButton: UIButton!
    @IBOutlet weak var TableView: UITableView!
    
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var filesArray: [URL] = []
    var textFileArray: [TextFile] = []
    var isPressed = false
    
    @IBAction func addFile(_ sender: Any) {
        isPressed = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.destination is FileViewController
        {
            if(isPressed == false){
            let vc = segue.destination as? FileViewController
            
            let row = TableView.indexPathForSelectedRow?.row
            if(row != nil){
            vc?.name = textFileArray[row!].Filename
            vc?.text = textFileArray[row!].Text
            //vc?.fileWithoutExtension = (textFileArray[row!].FileNameWithoutExtension?.absoluteString)!
            vc?.fileArray = textFileArray
            }
            }
            
            }
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textFileArray.count
        
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath) as! TextFileTableViewCell
        
        cell.fileNameLabel.text = textFileArray[indexPath.row].Filename
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFileButton.setTitle("Add File", for: .normal)
        
        var urlArray: [URL] = try! FileManager.default.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: [], options: [])
        
        for urlfile in urlArray {
            var fileName = FileManager.default.displayName(atPath: urlfile.absoluteString)
            var fileText: String = ""

            do {
                fileText = try String(contentsOf: urlfile, encoding: .utf8)
            }
            catch {/* error handling here */}
            
       
            textFileArray.append(TextFile(Filename: fileName, Text: fileText, FileSize: nil, LastModified: nil, FileNameWithoutExtension: nil))
            
            print(fileName)
            print(fileText)
            print("This is the file name without extension")
            print(urlfile)
        
            
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            let cell = self.textFileArray[indexPath.row]
            
            do {
                if(FileManager.default.fileExists(atPath: self.textFileArray[indexPath.row].Filename)){
                try FileManager.default.removeItem(at: NSURL(string: self.textFileArray[indexPath.row].Filename) as! URL)
                }
            } catch let error as NSError {
                print("Error: \(error.domain)")
            }
            
            self.TableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
        
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
