//
//  ContentView.swift
//  Shopping List
//
//  Created by Tony Hong on 3/11/22.
//

import SwiftUI

class Items: Identifiable {
    let imageName: String
    let itemName: String
    let quantity: Int
    init(image: String, item: String, count: Int) {
        self.imageName = image
        self.itemName = item
        self.quantity = count
    }
    
}

struct ContentView: View {
    
    var fruit_list = [
        Items(image: "banana", item: "Bananas", count: 3),
        Items(image: "apple", item: "Apples", count: 4),
        Items(image: "coconuts", item: "Coconuts", count: 5)
    ]
    var veggie_list = [
        Items(image: "pumpkin", item: "Pumpkins", count: 1),
        Items(image: "corn", item: "Corn", count: 4)
    ]
    var poultry_list = [
        Items(image: "wings", item: "Chicken Wings", count: 6),
        Items(image: "eggs", item: "Eggs", count: 12)

    ]
    
    
    var body: some View {
        NavigationView {
//            List(list) { i in
//                CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity).navigationTitle("Shopping List")
//                    .listRowSeparator(.hidden)
//            }
            List {
                Section(header: Text("Fruits")) {
                    ForEach(fruit_list) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Vegetables")) {
                    ForEach(veggie_list) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
                Section(header: Text("Poultry")) {
                    ForEach(poultry_list) { i in
                        CustomCell(imageName: i.imageName, itemName: i.itemName, quantity: i.quantity)
                    }
                }
            }
            .navigationBarTitle(Text("Shopping List"))

        }
    }
    
}
