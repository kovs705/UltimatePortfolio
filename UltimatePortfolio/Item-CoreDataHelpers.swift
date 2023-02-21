//
//  Item-CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Kovs on 17.02.2023.
//

import Foundation

extension Item {
    var itemTitle: String {
        title ?? "New Item"
    }
    
    var itemDetail: String {
        detail ?? ""
    }
    
    var itemCreationDate: Date {
        creationDate ?? Date()
    }
    
    static var example: Item {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let item = Item(context: viewContext)
        item.title = "Example title"
        item.detail = "this is an example item"
        item.priority = 3
        item.creationDate = Date()
        
        return item
    }
    
}
