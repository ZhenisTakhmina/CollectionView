//
//  MockData.swift
//  DishesCollection
//
//  Created by Tami on 13.06.2023.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    private let sales: ListSection = {
        .sales([
            .init(title: "salesburger", image: "pizza" ),
            .init(title: "salespizza", image: "pizza"),
            .init(title: "saleswok", image: "wok")
        ])
    }()
    
    private let category: ListSection = {
        .category([
            .init(title: "chicken", image: "pizza" ),
            .init(title: "pizza", image: "pizza"),
            .init(title: "burger", image: "wok"),
            .init(title: "hello", image: "wok")
        ])
    }()
    
    private let example: ListSection = {
        .example([
            .init(title: "chickenEx", image: "pizza" ),
            .init(title: "pizzaEx", image: "pizza"),
            .init(title: "burgerEx", image: "wok")
        ])
    }()
    
    var pagedata: [ListSection] {
        [sales,category,example]
    }
    
}
