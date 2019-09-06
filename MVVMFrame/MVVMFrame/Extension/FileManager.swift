//
//  FileManager.swift
//  MVVMFrame
//
//  Created by fangmengkai on 2019/6/18.
//  Copyright © 2019 linxi. All rights reserved.
//

import Foundation

class FibioFile {
    
    static let fileManager = FileManager.default
    
}

extension FibioFile {
    //FileManager
    open func getDocumentPath(directory: FileManager.SearchPathDirectory = .documentDirectory,
                         mask: FileManager.SearchPathDomainMask = .userDomainMask) -> URL {
        return FibioFile.fileManager.urls(for: directory, in: mask).first ?? URL(fileURLWithPath: "")
    }
    
    open func getFilePathFromUrl(urlStr: String) -> [String]? {
        if let url = URL(string: urlStr) {
            return getFilePathFromUrl(url: url)
        } else {
            return nil
        }
    }
    
    open func getFilePathFromUrl(url: URL) -> [String]? {
        let paths = try? FibioFile.fileManager.contentsOfDirectory(atPath: url.path)
        return paths
    }
    
    open func checkFile(path: String) -> Bool {
        return FibioFile.fileManager.fileExists(atPath: path)
    }
    
    open func writeToFile(data: Data, path: String) throws {
        if let url = URL(string: path) {
            do {
                try data.write(to: url)
            } catch {
                throw error
            }
        }
    }
    
    open func writeToFile(data: Data, url: URL) throws {
        do {
            try data.write(to: url)
        } catch {
            throw error
        }
    }
}
