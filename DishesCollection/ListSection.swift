//
//  ListSection.swift
//  DishesCollection
//
//  Created by Tami on 13.06.2023.
//

import Foundation

enum ListSection {
    
    case sales([ListItem])
    case category ([ListItem])
    case example ([ListItem])
    
    var items: [ListItem] {
        switch self {
        
        case .sales(let items):
            return items
        case .category(let items):
            return items
        case .example(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self{
            
        case .sales(_):
            return "Sales"
        case .category(_):
            return "Category"
        case .example(_):
            return "Example"
        }
    }
}
