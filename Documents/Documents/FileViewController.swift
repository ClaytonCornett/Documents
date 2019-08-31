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

        TextField.text = name
        TextView.text = text

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
            try fileText!.write(to: fileURL, atomically: true, encoding: .utf8)
                    
            
            }
        }
        catch let error as NSError{
            print(error)
        }
        
        fileArray.append(TextFile(Filename: fileName!, Text: fileText!, FileSize: nil, LastModified: nil, FileNameWithoutExtension: nil))
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is DocumentViewController
        {
            let vc = segue.destination as? DocumentViewController
                vc?.textFileArray = []
                vc?.textFileArray = fileArray
            
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


