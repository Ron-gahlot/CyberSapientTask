//
//  Untitled.swift
//  CyberSapient
//
//  Created by Rahul Gahlot on 11/03/25.
//

import Foundation

struct TaskItem: Identifiable, Equatable {
    let id: UUID
    var title: String
    var taskDesc: String?
    var priority: String
    var dueDate: Date
    var isCompleted: Bool

    init(id: UUID = UUID(), title: String, taskDescription: String? = nil, priority: String, dueDate: Date, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.taskDesc = taskDescription
        self.priority = priority
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}
