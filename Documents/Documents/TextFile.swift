//
//  TextFile.swift
//  Documents
//
//  Created by Clayton Cornett on 8/26/19.
//  Copyright © 2019 Clayton Cornett. All rights reserved.
//

import Foundation

class TextFile{
    var Filename: String
    var Text: String
    var FileSize: String
    var LastModified: Date
    
    init(Filename: String, Text: String, FileSize: String, LastModified: Date) {
        self.Filename = Filename
        self.Text = Text
        self.FileSize = FileSize
        self.LastModified = LastModified
    }
}
