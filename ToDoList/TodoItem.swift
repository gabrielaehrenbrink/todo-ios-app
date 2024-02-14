//
//  TodoItem.swift
//  ToDoList
//
//  Created by Gabriela Ehrenbrink on 13/02/2024.
//

import Foundation


struct TodoItem: Identifiable, Equatable {
    var id = UUID()
    var userInput: String
    var isToggled: Bool
}
