//
//  FileViewController.swift
//  Documents
//
//  Created by Clayton Cornett on 8/28/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//

import UIKit

class FileViewController: UIViewController {

    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var TextField: UITextField!
    
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var name: String = ""
    var text: String = ""
    var fileWithoutExtension: String = ""
    var fileArray: [TextFile] = []
    var isPressed = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //var tableCell = DocumentViewController()
        //var name = tableCell.textFileArray[1].Filename
       // var text = tableCell.textFileArray[1].Text
        
        //let str = String(data: fileArray[1].Text!, encoding: String.Encoding)
        //TextView.text = text as? Data
        
        
        TextField.text = name
        TextView.text = text
        //TextField.text = fileWithoutExtension
        
        
        //TextView.text = str
        
        //TextField.text = fileArray[1].Filename
        //TextView.text = fileArray[1].Text
        
    }
    

    @IBAction func saveFile(_ sender: Any) {
        
        var fileName = TextField.text
        var fileText = TextView.text
        var fileURL = documentsURL.appendingPathComponent(fileName!).appendingPathExtension("txt")
        var originalFileURL = documentsURL.appendingPathComponent(name).appendingPathExtension("txt")
        
        
        do{
            if(isPressed){
                try fileText!.write(to: fileURL, atomically: true, encoding: .utf8)
            }
            else{
               // if(FileManager.default.fileExists(atPath: originalFileURL.absoluteString)){
            //try FileManager.default.removeItem(at: originalFileURL)
            try fileText!.write(to: fileURL, atomically: true, encoding: .utf8)
                    
               // }
            }
        }
        catch let error as NSError{
            print(error)
        }
        
        fileArray.append(TextFile(Filename: fileName!, Text: fileText!, FileSize: nil, LastModified: nil, FileNameWithoutExtension: nil))
        
       // navigationController?.popViewController(animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is DocumentViewController
        {
            let vc = segue.destination as? DocumentViewController
                vc?.textFileArray = []
                vc?.textFileArray = fileArray
                //vc?.viewDidLoad()
            
            }
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


