//
//  project-CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Kovs on 17.02.2023.
//

import Foundation

extension Project {
    
    var projectTitle: String {
        title ?? "New project"
    }
    
    var projectDetail: String {
        detail ?? ""
    }
    
    var projectColor: String {
        color ?? "Light Blue"
    }
    
    var projectItems: [Item] {
        let itemArray = items?.allObjects as? [Item] ?? []
        
        return itemArray.sorted { first, second in
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else if  first.completed == true {
                if second.completed == false {
                    return false
                }
            }
            
            // if both objects are completed or not:
            if first.priority > second.priority {
                return true
            } else if first.priority < second.priority {
                return false
            }
            
            // both completed or not and have the same priority:
            return first.itemCreationDate < second.itemCreationDate
        }
    }
    
    var completionAmount: Double {
        let originalItems = items?.allObjects as? [Item] ?? []
        guard originalItems.isEmpty == false else { return 0 }
        
        let completedItems = originalItems.filter(\.completed)
        // set to true every item which is completed { $0.completed == true }
        return Double(completedItems.count) / Double(originalItems.count)
    }
    
    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let project = Project(context: viewContext)
        project.title = "Example project"
        project.detail = "this is an example project"
        project.closed = true
        project.creationDate = Date()
        
        return project
    }
    
}
