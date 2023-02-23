//
//  Sequence-Sorting.swift
//  UltimatePortfolio
//
//  Created by Kovs on 23.02.2023.
//

import Foundation

extension Sequence {
    
    func sorted<Value>(by keyPath: KeyPath<Element, Value>, using areInIncreasingOrder: (Value, Value) throws -> Bool) rethrows -> [Element] {
        try self.sorted {
            try areInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }
    
    func sorted <Value: Comparable>(by keyPath: KeyPath<Element, Value>) -> [Element] {
        // a func with some sort of a Value which is Comparable, sorted by a keyPath, and this keyPath will point to Item object and our value
        self.sorted {
            $0[keyPath: keyPath] < $1[keyPath: keyPath]
        }
    }
}
