//
//  TreeTraversal.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-22.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 50)

func preorder(node: Int) {
    if node == -1 { return }
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    preorder(node: tree[node][0])
    preorder(node: tree[node][1])
}

func inorder(node: Int) {
    if node == -1 { return }
    inorder(node: tree[node][0])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    inorder(node: tree[node][1])
}

func postorder(node: Int) {
    if node == -1 { return }
    postorder(node: tree[node][0])
    postorder(node: tree[node][1])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
}

func treeTraversal() {
    let n = Int(readLine()!)!
    for _ in 0..<n {
        let nodeInfo = readLine()!.split(separator: " ").map{ String($0) }
        let x = Character(nodeInfo[0]).ascii - 65
        let l = Character(nodeInfo[1]).ascii
        let r = Character(nodeInfo[2]).ascii
        tree[x][0] = l == 46 ? -1 : l - 65
        tree[x][1] = r == 46 ? -1 : r - 65
    }
    preorder(node: 0)
    print()
    inorder(node: 0)
    print()
    postorder(node: 0)
    print()
}
