//
//  main.swift
//  FileCrawl
//
//  Created by Guilherme Wahlbrink on 2019-03-11.
//  Copyright © 2019 Guilherme Wahlbrink. All rights reserved.
//


// To run the code is better to create a mac-os terminal executable
// xcrun -sdk macosx swiftc main.swift  -o myTree


import Foundation

// Helper Characters to Build the Tree
// ├─
// └─
// │

func fileCrawl(_ folderPath:String, _ spaces:String, _ files: inout Int, _ dirs: inout Int){
    let fileMngr = FileManager.default;
    var isDir : ObjCBool = false
    let array = try! fileMngr.contentsOfDirectory(atPath: folderPath)
    for pos in array{
        let file = folderPath+"/"+pos
        fileMngr.fileExists(atPath: file, isDirectory: &isDir)
        if !isDir.boolValue {
            files += 1
            if pos == array[array.count-1]{
                print(spaces+"└─"+pos)
            }else{
                print(spaces+"├─"+pos)
            }
        }else{
            let newPath = folderPath+"/"+pos
            dirs += 1
            if pos == array[array.count-1]{
                print(spaces+"└─"+pos)
                fileCrawl(newPath,spaces+"   ",&files,&dirs)
            }else{
                print(spaces+"├─"+pos)
                fileCrawl(newPath,spaces+"│  ",&files,&dirs)
            }
        }
    }
}


// Should uncomment the hard coded path to run in xcode and input the desired path
func main(){
    let fileMngr = FileManager.default;
    
    var files = 0
    var dirs = 0
    //let path = "/Users/guilherme/Desktop/FileCrawl/FileCrawl"
    let path = fileMngr.currentDirectoryPath
    fileCrawl(path,"",&files,&dirs)
    print("")
    print(String(dirs)+" directories, "+String(files)+" files")
}

main()
