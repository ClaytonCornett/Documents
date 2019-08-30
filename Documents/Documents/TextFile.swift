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
    var FileSize: Any?
    var LastModified: Date?
    var FileNameWithoutExtension: URL?
    
    init(Filename: String, Text: String, FileSize: Any?, LastModified: Date?, FileNameWithoutExtension: URL?) {
        self.Filename = Filename
        self.Text = Text
        self.FileSize = FileSize
        self.LastModified = LastModified
        self.FileNameWithoutExtension = FileNameWithoutExtension
    }
}
